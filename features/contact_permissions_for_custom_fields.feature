@set6
Feature: Contacts => Permissions for Custom Fields

Background: Start each Scenario with a clean slate
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset existing CFGs

Scenario: Permissions for a Project Administrator
  And I am on the contacts custom fields edit page
  And I click the "Add Custom field" link
  And I wait for "5" seconds
  And I add a droplist
  And I click the "Add Custom field" link
  And I add a "True/False" field dependent on droplist
  And I am on the contacts view custom field group permissions page
  And I wait for "4" seconds
  And I verify all checkboxes are checked
  Then I should see the text "(Modified)"
  And I click the "new_ui_blue_button_inner" div
  And I click the "Logout" link
   
  #test cfg as project administrator
  
  And I login with "rdownie+pa@qamail1.rollstream.com"
  And I am on the edit profile page
  And I select "three" from "1"
  Then I click the "1" radio button
  And I click the "new_ui_blue_button_inner" div
  And I wait for "4" seconds
  Then I should see the text "True"
  And I remove existing CFGs
