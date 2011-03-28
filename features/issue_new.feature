@set3
Feature: Adding New Issues

Scenario: Setup
Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  * I setup the issue type
  And I click the "Logout" link

Scenario: Try to add an issue with nil for un-editable fields
  Given I login with "rdownie+hcreator@qamail1.rollstream.com"
  And I am on the Issues page
  And I add an issue with company "PING" with color "red"
  And I wait for "3" seconds
  Then I should NOT see the text "cannot be changed due to lack of permission"
  Then I should see the text "Issue created"