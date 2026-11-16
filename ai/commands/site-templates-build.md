---
description: Build a site from a site template in the site-templates/ folder of the Webship Workspace — find the builder of the template, check the name is free, build, and say what the template made of the site.
argument-hint: '<template> <name>'
---

# /site-templates-build

Build a site from a site template in `~/workspace/site-templates` from: `$ARGUMENTS`

The arguments are the text typed after the command: the first word is the template (`haven`,
`byte`, `webship_starter`), the second word is the name of the site. With no name, stop and ask
for one. The workspace is container-based (DDEV by default): the builder runs the site in its
own container, nothing on the host.

## 1. Find the builder

```bash
cd ~/workspace/site-templates
grep -H "^# workspace-name:" cmd-*-project.sh
```

The builder is the `cmd-<template>-…project.sh` whose name starts with the template. When more
than one fits (a template with and without a version line), list them and ask.

## 2. Read its flags, and make sure the name is free

```bash
bash cmd-haven-project.sh --help
ls -d ~/workspace/*/<name> 2>/dev/null
ddev list | grep -w <name>
```

Use the builder that was found. A builder deletes a project of the same name first: if the name
is taken, stop and ask.

## 3. Build

```bash
bash cmd-haven-project.sh <name>
```

With the builder that was found; add `--add-users` where its help lists it. Run it once. If it
fails, show the line that failed and stop.

## 4. Report

The template, the address (`https://<name>.ddev.site`), and what the template made of the site:
in the site's folder, `ddev drush status` and `ddev drush pm:list --status=enabled --type=theme`.
Then ask whether to keep the site or remove it with `bash cmd-tools-remove.sh <name>`. For more
than one build, hand over to the `site-templates-builder` agent; the `site-templates-workflow`
skill lists every builder.
