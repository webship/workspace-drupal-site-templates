# @webship.co/workspace-drupal-site-templates

The **Drupal site templates** workspace of the [Webship Workspace](https://github.com/webship/workspace) dashboard:
the `site-templates/` folder (type `sites`), its settings file (`core/config/workspace.site-templates.settings.yml`),
its commands and its docs, as a plugin.

## Use it

```bash
cd ~/workspace
bash core/scripts/plugins.sh --require github:webship/workspace-drupal-site-templates
bash core/scripts/plugins.sh --activate drupal-site-templates     # puts `site-templates` on the workspaces list of settings.yml
bash core/scripts/plugins.sh --install drupal-site-templates      # the folder, its settings file (once), its commands, its docs (once)
```

The settings file and the docs are placed once and never overwritten: they hold what you put there.
`--deactivate` takes the workspace off the list; the folder and its content stay.

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
