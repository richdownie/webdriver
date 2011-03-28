@set2 @ws
Feature: Crud a Workspace

Background: 
Given I login with "rdownie@qamail1.rollstream.com"
And I am on the workspaces page

Scenario: Add a Workspace
  And I add a new Workspace
  And I click the "Logout" link

Scenario: Delete a Workspace
  And I click the "new_ui_system_button_inner" div
  And I click the "Delete" link
  And I click the "No" button
  And I click the "Delete" link
  And I click the "Yes" button
  And I click the "Logout" link

Scenario: Edit a Workspace
  And I click the "new_ui_system_button_inner" div
  And I click the "Edit" link
  And I fill in the text field "workspace_name" with random "123 WS Downie"
  And I click the "Save" button
  And I click the "Logout" link”