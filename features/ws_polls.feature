@set2 @ws
Feature: Poll Scenarios

Background:
Given I login with "rdownie@qamail1.rollstream.com"
  And I am on the workspaces page
  And I click the "View" div

Scenario: Add a Poll
  And I add a new poll
  Then I should see the text "The poll was created successfully"
  And I click the "Logout" link

Scenario: Edit a Poll
  And I click the "View All Polls" link
  And I click the "Edit" link
  And I fill in the text field "workspace_poll_title" with "Updated What is your favorite color?"
  And I click the "Save" button
  Then I should see the text "The poll was updated successfully"
  And I click the "Logout" link

Scenario: Add a member to a new poll
  And I add a new poll
  And I click the "Home" link
  And I click the "Add Member" link
  And I fill in the text field "email" with "gina1@example.org"
  And I click the "Add Member" button
  And I click the "Logout" link