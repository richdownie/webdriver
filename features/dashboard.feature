@set2
Feature: Home Dashboard Page and Tabs
	
Scenario: My Profile Page
Given I login with "rdownie@qamail1.rollstream.com"
	And I am on the my profile page
	Then I check for the header and footer
	Then I should see the text "EDIT PROFILE"
  And I click the "Logout" link
	
Scenario: Edit My Profile Page
	Given I login with "rdownie@qamail1.rollstream.com"
	And I am on the edit profile page
	And I fill in the text field "person_salutation" with random "Mr"
	And I click the "SAVE CHANGES" div
  And I click the "Logout" link