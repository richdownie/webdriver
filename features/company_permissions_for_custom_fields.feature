@firefox
Feature: Companies => Permissions for Custom Fields

Background: Start each Scenario with a clean slate
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset existing CFGs

Scenario: Permissions for a Project Administrator display Dependent Children fields
  #setup fields and permissions for project administrator
  And I am on the companies custom fields edit page
  And I click the "Add Custom field" link
  And I add a droplist
  And I click the "Add Custom field" link
  And I add a "True/False" field dependent on droplist
	And I am on the companies view custom field group permissions page
	And I wait for "2" seconds
	And I verify all checkboxes are checked
  Then I should see the text "(Modified)"
  And I click the "new_ui_blue_button_inner" div
  And I click the "Logout" link
  
  #test cfg as project administrator
  And I login with "rdownie+pa@qamail1.rollstream.com"
  Given I am on the my company page
  And I click the "Edit Company" div
  And I select "three" from "1"
  Then I click the "1" radio button
  And I click the "new_ui_blue_button_inner" div
  Then I should see the text "True"
  And I remove existing CFGs

