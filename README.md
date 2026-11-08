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
| (none) |

The bash functions these commands call live in the dashboard's `core/scripts/functions`.
