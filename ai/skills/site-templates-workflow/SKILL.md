---
name: site-templates-workflow
description: How work is done in the `site-templates/` folder of the Webship Workspace — which `cmd-*-project.sh` builds a site from which site template, what a build does (the codebase, the template, the install), which builders take a flag and which take only a name, how a build is cloned and removed, with the flags of each command and the settings keys of the folder. Use when asked to "build a site from a site template", "which site templates are there", "build Webship Starter", "remove the template build", or when a command of `site-templates/` is about to be run.
argument-hint: '[what you are about to do in site-templates]'
---

# site-templates-workflow

`~/workspace/site-templates` is the Site templates folder of a Webship Workspace (container-based, DDEV by default).
Site templates are Drupal CMS sites built from a site template: a recipe that decides what the site is before anything is written (its content types, its editorial workflow, its front end), and the Webship site templates built on a Drupal 11 base. It comes with the Site templates plugin (`@webship.co/workspace-drupal-site-templates`), which places the commands below in the folder. Every command finds the workspace from its own path; run it from the folder, and read `bash <command> --help` before quoting a flag.

## The order of work

1. **Pick** the template: `grep -H "^# workspace-name:" cmd-*-project.sh`.
2. **Make sure the name is free**: a builder deletes a project of the same name first.
3. **Build**: `bash cmd-haven-project.sh mysite` (a Drupal CMS site template: a name and nothing
   else), or `bash cmd-webship_starter-1-0-x-project.sh mysite --add-users` (a Webship one).
4. **Look** at what the template made of the site: `https://mysite.ddev.site`, and in the folder
   `ddev drush status`.
5. **Clear** it, after asking: `bash cmd-tools-remove.sh mysite`.

## Builders

| Builder | Builds | Flags |
| --- | --- | --- |
| `cmd-archimedes-project.sh` | Archimedes (Drupal CMS site template) | none |
| `cmd-byte-project.sh` | Byte (Drupal CMS site template) | none |
| `cmd-caresphere-project.sh` | CareSphere (Drupal CMS site template) | none |
| `cmd-convene-project.sh` | Convene (Drupal CMS site template) | none |
| `cmd-convivial_gov-project.sh` | Convivial Gov (Drupal CMS site template) | none |
| `cmd-dashi-project.sh` | Dashi ^1 (Drupal CMS site template) | none |
| `cmd-everbright-project.sh` | Everbright (Drupal CMS site template) | none |
| `cmd-forma-project.sh` | Forma (Drupal CMS site template) | none |
| `cmd-goodwell-project.sh` | Goodwell ^1 (Drupal CMS site template) | none |
| `cmd-haven-project.sh` | Haven (Drupal CMS site template) | none |
| `cmd-healthcare-project.sh` | Healthcare (Drupal CMS site template) | none |
| `cmd-hourglass_inc-project.sh` | Hourglass Corporate ^1 (Drupal CMS site template) | none |
| `cmd-local-project.sh` | Local (Drupal CMS site template) | none |
| `cmd-lupus_decoupled_starter-project.sh` | Nuxt Starter (Drupal CMS site template) | none |
| `cmd-mercury_demo-project.sh` | Mercury Demo (Drupal CMS site template) | none |
| `cmd-provus_edu-project.sh` | Provus EDU (Drupal CMS site template) | none |
| `cmd-pulse-project.sh` | Pulse (Drupal CMS site template) | none |
| `cmd-summit-project.sh` | Summit (Drupal CMS site template) | none |
| `cmd-webapi_starter-1-0-x-project.sh` | WebAPI Starter 1.0.x (Drupal 11.4.x) | `--add-users` |
| `cmd-webship_portal-1-0-x-project.sh` | Webship Portal 1.0.x (Drupal 11.4.x) | `--add-users` `--with-pending-fixes` |
| `cmd-webship_starter-1-0-x-project.sh` | Webship Starter 1.0.x (Drupal 11.4.x) | `--add-users` `--with-pending-fixes` |
| `cmd-webships_project-1-0-x-project.sh` | Webships Project 1.0.x (Webships installer) | `--add-users` `--php-version` `--template` |
| `cmd-webships_starter-1-0-x-project.sh` | Webships Starter 1.0.x (Drupal 11.4.x) | `--add-users` |
| `cmd-website-1-0-x-project.sh` | Website 1.0.x (Webship installer) | `--add-users` `--php-version` `--template` `--with-pending-fixes` |
| `cmd-website_starter-1-0-x-project.sh` | Website Starter 1.0.x (Drupal 11.4.x) | `--add-users` `--with-pending-fixes` |
| `cmd-website_starter-project.sh` | Website Starter (Webship site template) | none |

## Commands

| Command | What it does | Flags |
| --- | --- | --- |
| `cmd-tools-checks.sh` | Runs the code-quality checks an item's `package.json` declares; `--list` prints the plan and runs nothing | `--browser` `--e2e` `--fail-fast` `--install` `--list` `--only` `--runner` `--skip` |
| `cmd-tools-clone.sh` | Folder and database under a new name, here or in another folder | `--branch` `--extra-hostname` `--no-build-copy` `--no-db` `--target-workspace` `--to` `--with-workspace-hostname` `--worktree` |
| `cmd-tools-reclaim.sh` | Disk held by projects whose folder is gone: a dry run unless `--apply` | `--apply` `--keep-days` `--list-protected` `--only` |
| `cmd-tools-remove.sh` | Containers, volumes and folder together; refuses work that is on no remote unless `--force` | `--backup` `--force` `--orphans` |
| `cmd-tools-screen.sh` | A detached session with a log the dashboard follows | `--follow` `--list` `--log` `--run` `--stop` |

## Settings

| Key | File | What it says |
| --- | --- | --- |
| `doc.name` | `core/config/workspace.site-templates.settings.yml` | The folder under the workspace root: `site-templates` |
| `type` | `core/config/workspace.site-templates.settings.yml` | `sites`: the rows of the page are built sites, with the Build, Tests, Checks, Users, Backup and Remove actions |
| `site_templates` | `core/config/workspace.site-templates.settings.yml` | The site templates the folder knows, by the name of their recipe |
| `assistant.name`, `assistant.placeholder` | `core/config/workspace.site-templates.settings.yml` | What the assistant is called on this page; `default` takes the workspace's |
| `workspaces` | `core/config/settings.yml` | The active folders; `site-templates` is on it once the plugin is activated |

## Rules

- **A builder deletes a project of the same name first.** Never give it the name of a site
  somebody still needs.
- **The template decides what the site is.** Do not add a profile, packages or modules to a
  build to make it something else: build another template.
- **Containers only** (DDEV by default): in a site's folder, `ddev composer …`, `ddev drush …`,
  `ddev export-db --file=…`, `ddev start -y`, `ddev stop` (no `-y`); never `composer`, `drush`,
  `php`, `npm` or `mysql` on the host. Never write database settings into `settings.php`.
- **One build at a time**, and look at `df -h` and `free -g` first.
- A site built to look at a template is cleared when it was looked at, after asking:
  `bash cmd-tools-remove.sh <name>`.

The Site templates plugin places these beside this one, each in the workspace folder of its kind: the agent `site-templates-builder` (`ai-agents/`), the command `/site-templates-build` (`ai-commands/`) and the prompt `site-templates-build-and-compare` (`ai-prompts/`).

## The book

For any automated functional testing in this work (a Gherkin feature, a step definition, choosing a
step, a test run and its failures), read the book *Automated Functional Testing Recipes* first.

- **Where.** Use the first that exists: `.claude/automated-functional-testing-recipes/` in the project,
  `~/.claude/automated-functional-testing-recipes/` (installed by webship/webship-js-ai-agent,
  webship/webship-js-skills or webship/ai-agents), or
  https://github.com/webship/webship-js-ai-agent/tree/2.0.x/automated-functional-testing-recipes
- **How.** Its `README.md` first, then the chapter that matches the task (one file per chapter,
  named by its subject), not the single complete file.
- **Which wins.** The installed webship-js package and the step pack are the source of truth for
  step phrasing. When they differ from the book, follow them and say so.
