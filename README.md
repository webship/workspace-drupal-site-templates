# @webship.co/workspace-drupal-site-templates

The **Drupal site templates** workspace of the [Webship Workspace](https://github.com/webship/workspace) dashboard:
the `site-templates/` folder (type `sites`), its settings file (`core/config/workspace.site-templates.settings.yml`),
its commands and its docs, as a plugin.

## Use it

```bash
cd ~/workspace
bash core/scripts/plugins.sh --require github:webship/workspace-drupal-site-templates
bash core/scripts/plugins.sh --activate drupal-site-templates --with-needs     # puts `site-templates` on the workspaces list of settings.yml
bash core/scripts/plugins.sh --install drupal-site-templates      # the folder, its settings file (once), its commands, its docs (once)
```

The settings file and the docs are placed once and never overwritten: they hold what you put there.
`--deactivate` takes the workspace off the list; the folder and its content stay.

## What it needs

The AI items land in the four AI folders, so the manifest needs them (`needs`): `ai-agents`, `ai-skills`, `ai-commands`, `ai-prompts`. `--activate drupal-site-templates` and `--install drupal-site-templates` stop while one is missing and name it; with `--with-needs` they are required, activated and installed first.

## The AI items

The plugin carries its own AI items (`ai/` in the package, the manifest's `ai` block), written for the work this folder is for. `--install` places each one in the workspace folder of its kind, when that folder is an active workspace folder; `--uninstall` removes them, and keeps one that was edited in its folder.

| Item | Kind | Lands in | What it is for |
| --- | --- | --- | --- |
| `site-templates-builder` | Agent | `ai-agents/site-templates-builder.md` | Builds a site from a site template in `site-templates/` (a Drupal CMS one or a Webship one), says what the template made of it, clones it and removes it |
| `site-templates-workflow` | Skill | `ai-skills/site-templates-workflow/` | How work is done in `site-templates/`: pick, build, look, clear; every builder with its flags, the tools, the settings keys |
| `/site-templates-build` | Command | `ai-commands/site-templates-build.md` | `/site-templates-build <template> <name>`: finds the builder, checks the name is free, builds and says what the template made of the site |
| `site-templates-build-and-compare` | Prompt | `ai-prompts/site-templates-build-and-compare.md` | A new session that builds two site templates and says how the sites differ |

From its folder an item is installed into the AI CLI (Claude Code by default) like any other: the folder's page on the dashboard, or `bash cmd-tools-ai-items.sh <name> --install` in the AI folder (`--to dev/<project>` for one project). A prompt is not installed: the New screen form lists it as the start of a new session. The body of every item is plain Markdown any AI CLI can follow; Claude Code is the default shape (the frontmatter, the launch line of a prompt). Every command, flag, settings key and path an item names is checked by `tests/items.test.ts`; the shape of the items is the one of the reference, [`docs/plugin-items-pattern.md` of the WordPress plugin](https://github.com/webship/workspace-wordpress/blob/1.0.x/docs/plugin-items-pattern.md).

## The commands

| Command |
| --- |
| `cmd-archimedes-project.sh` |
| `cmd-byte-project.sh` |
| `cmd-caresphere-project.sh` |
| `cmd-convene-project.sh` |
| `cmd-convivial_gov-project.sh` |
| `cmd-dashi-project.sh` |
| `cmd-everbright-project.sh` |
| `cmd-forma-project.sh` |
| `cmd-goodwell-project.sh` |
| `cmd-haven-project.sh` |
| `cmd-healthcare-project.sh` |
| `cmd-hourglass_inc-project.sh` |
| `cmd-local-project.sh` |
| `cmd-lupus_decoupled_starter-project.sh` |
| `cmd-mercury_demo-project.sh` |
| `cmd-provus_edu-project.sh` |
| `cmd-pulse-project.sh` |
| `cmd-summit-project.sh` |
| `cmd-tools-checks.sh` |
| `cmd-tools-clone.sh` |
| `cmd-tools-reclaim.sh` |
| `cmd-tools-remove.sh` |
| `cmd-tools-screen.sh` |
| `cmd-webapi_starter-1-0-x-project.sh` |
| `cmd-webship_portal-1-0-x-project.sh` |
| `cmd-webship_starter-1-0-x-project.sh` |
| `cmd-webships_project-1-0-x-project.sh` |
| `cmd-webships_starter-1-0-x-project.sh` |
| `cmd-website-1-0-x-project.sh` |
| `cmd-website_starter-1-0-x-project.sh` |
| `cmd-website_starter-project.sh` |

The bash functions these commands call live in the dashboard's `core/scripts/functions`.
