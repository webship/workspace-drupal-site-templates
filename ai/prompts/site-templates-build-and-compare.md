Build two site templates side by side in the site-templates folder and say how the sites differ.

The launch line is for Claude Code, the default; the text between the triple quotes can be given to another AI CLI as it is.

```
claude --permission-mode bypassPermissions """
Build the site templates <template-a> and <template-b> in the site-templates folder and compare them
# ~/workspace/site-templates · https://<template-a>1.ddev.site and https://<template-b>1.ddev.site
# container-based (DDEV by default): nothing on the host, one build at a time
# a builder deletes a project of the same name first: stop if a name is a site somebody still needs

1. grep -H "^# workspace-name:" cmd-*-project.sh
   tell me the builder of each of the two templates
2. bash <builder-a> <template-a>1
3. bash <builder-b> <template-b>1
4. in each site's folder: ddev drush status ; ddev drush pm:list --status=enabled --no-core
   tell me the default theme, the content types and the modules each template turned on
5. compare: what one has and the other does not

If a command fails, show the line that failed and stop. Do not retry with other flags.
Report the two addresses and the comparison as a short table.
Then ask me whether to keep the sites or remove them with: bash cmd-tools-remove.sh <name>
"""
```
