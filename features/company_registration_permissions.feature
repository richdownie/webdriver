@set5
Feature: Companies => Registration Permissions for Custom Fields

Background: Start each Scenario with a clean slate
Given I login with "rdownie@qamail1.rollstream.com"
	And I am on the onboarding admin page
	Then I check for the header and footer
	And I verify all checkboxes are unchecked

Scenario: Verify columns and rows display on the page
	Then I should see the text "Requester"
	Then I should see the text "Pre-Approval"
	Then I should see the text "Primary Contact"
	Then I should see the text "Approval"
  And I click the "Logout" link