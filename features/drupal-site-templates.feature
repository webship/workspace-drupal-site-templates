Feature: The Drupal site templates workspace plugin
  Once the plugin is activated and installed, the site-templates workspace is on the dashboard, and the
  Plugins page lists the plugin with its four steps.

  Scenario: The workspace page is there
    Given I am on "/site-templates"
     Then I should see "Drupal site templates"

  Scenario: The plugin is listed on the Plugins page
    Given I am on "/settings/plugins"
     Then I should see "Drupal site templates"
      And I should see "@webship/workspace-drupal-site-templates"
