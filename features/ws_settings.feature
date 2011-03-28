@set2 @ws
Feature: Workspace Settings Scenarios

Scenario: Set and Save all radio buttons
Given I login with "rdownie@qamail1.rollstream.com"
  And I am on the workspaces page
  And I click the "View" div
  And I click the "Workspace Settings" link
  And I click the "workspace_email_notification_no_notification" radio button
  And I click the "Save" button
  Then I should see the text "Workspace settings were successfully updated."
  And I click the "Home" link
  And I click the "Workspace Settings" link
  And I click the "workspace_email_notification_daily_notification" radio button
  And I click the "Save" button
  Then I should see the text "Workspace settings were successfully updated."
  And I click the "Home" link
  And I click the "Workspace Settings" link
  And I click the "workspace_email_notification_instant_notification" radio button
  And I click the "Save" button
  Then I should see the text "Workspace settings were successfully updated."
  And I click the "Home" link
  And I click the "Logout" link