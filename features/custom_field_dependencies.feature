Feature: Allow Question/Custom Field Dependency based on Multiple Values

Background: Setup One time for remaining features
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset existing CFGs
  
###################################################### COMPANIES ################################################################
@set3
Scenario Outline: Companies * Adding a Droplist with Multiple Values for dependent fields with OR condition
	And I am on the companies custom fields edit page
  And I click the "Add Custom field" link
  And I add a droplist
  And I click the "Add Custom field" link
  And I add a <type> field dependent on droplist
  Given I am on the my company page
  And I click the "Edit Company" div
  And I select "two" from "1"
  Then I click the "1" <action>
  And I click the "new_ui_blue_button_inner" div
  Then I should see the text "True"
  Given I am on the my company page
  And I click the "Edit Company" div
  And I select "three" from "1"
  Then I click the "1" <action>
  And I click the "new_ui_blue_button_inner" div
  Then I should see the text "True"
  And I remove existing CFGs
  
  Examples:
    | type         | action |
    | "True/False" | radio button |

@firefox
Scenario Outline: Companies * Adding both a Multiple Choice with Multiple Values for dependent fields with AND condition
	And I am on the companies custom fields edit page
  And I click the "Add Custom field" link
  And I add a multiple choice
  And I click the "Add Custom field" link
  And I add a <type> field dependent on multiple choice
  Given I am on the my company page
  And I click the "Edit Company" div
  And I verify all checkboxes are checked
  Then I click the "1" <action>
  And I click the "new_ui_blue_button_inner" div
  Then I should see the text "True"
  And I remove existing CFGs

  Examples:
    | type         | action |
    | "True/False" | radio button |

######################################################## CONTACTS #############################################################
@set3
Scenario Outline: Contacts * Adding a Droplist with Multiple Values for dependent fields with OR condition
	And I am on the contacts custom fields edit page
  And I click the "Add Custom field" link
  And I add a droplist
  And I click the "Add Custom field" link
  And I add a <type> field dependent on droplist
  And I am on the edit profile page
  And I select "two" from "1"
  And I wait for "3" seconds
  Then I click the "1" <action>
  And I click the "new_ui_blue_button_inner" div
  Then I should see the text "True"
  And I am on the edit profile page
  And I select "three" from "1"
  And I wait for "3" seconds
  Then I click the "1" <action>
  And I click the "new_ui_blue_button_inner" div
  Then I should see the text "True"
  And I remove existing CFGs
  
  Examples:
    | type         | action |
    | "True/False" | radio button |

@firefox
Scenario Outline: Contacts * Adding both a Multiple Choice with Multiple Values for dependent fields with AND condition
	And I am on the contacts custom fields edit page
  And I click the "Add Custom field" link
  And I add a multiple choice
  And I click the "Add Custom field" link
  And I add a <type> field dependent on multiple choice
  And I am on the edit profile page
  And I verify all checkboxes are checked
  Then I click the "1" <action>
  And I click the "new_ui_blue_button_inner" div
  Then I should see the text "True"
  And I remove existing CFGs

  Examples:
    | type         | action |
    | "True/False" | radio button |

######################################################### FORMS ############################################################
@set3
Scenario Outline: Public Web Forms  
	And I reset projects and activities
  Given I add a "Send a Message" activity to an existing project
	And I click row "1" in the "list" table
	And I click the "WEB FORMS" div
	And I click the "new_ui_blue_button_inner" div
	And I fill in the text field "1" with "Company Form"
	And I click the "3" radio button
	And I click the "SAVE CHANGES" div
	And I wait for "3" seconds
	
  And I click the "Add Question" link
  And I add a droplist
  And I click the "Add Question" link
  And I add a <type> field dependent on droplist
  
  And I click the "new_ui_blue_button_inner" div
  And I wait for "2" seconds
  And I click the "Test" div
  And I wait for "3" seconds
  And I select "two" from "1"
  Then I click the "1" <action>
  And I click the "new_ui_blue_button_inner" div
  Then I should see the text <result>
  And I click the "WEB FORMS" div
  And I wait for "2" seconds
  And I click the "Company Form" link
  And I wait for "2" seconds
  And I click the "Test" div
  And I wait for "3" seconds
  And I select "three" from "1"
  Then I click the "1" <action>
  And I click the "new_ui_blue_button_inner" div
  Then I should see the text <result>
  And I click the "Logout" link
  
  Examples:
    | type         | action       | result  |
    | "True/False" | radio button | "True"  |
    | "Yes/No"     | radio button | "Yes"   | 

@set3
Scenario: Community Web Forms  
	And I am on the companies custom fields edit page
  And I click the "Add Custom field" link
  And I add a droplist
	And I reset projects and activities
  Given I add a "Send a Message" activity to an existing project
	And I click row "1" in the "list" table
	And I click the "WEB FORMS" div
	And I click the "new_ui_blue_button_inner" div
	And I fill in the text field "1" with "Company Form"
	And I click the "SAVE CHANGES" div
	And I wait for "3" seconds
	And I click the "Copy Question Group" link
	And I select "Company - CFG_companies" from "1"
	And I click the "Copy" button
	And I wait for "4" seconds
	And I should see the text "This question is copied from CFG_companies - Drop List Parent"
	And I click the "new_ui_blue_button_inner" div
	And I click the "Test" div
	And I select "two" from "1"
	And I click the "SUBMIT" div
	And I wait for "5" seconds
	Then I should see the text "two"

######################################################### Change Management ###############################################
@firefox
Scenario: Edit a Custom Field Dependency thru the Change Management procedure
  And I remove all existing Onboard Requests
  And I am on the companies custom fields edit page
  And I click the "Add Custom field" link
  And I add a droplist
  And I am on the companies view custom field group permissions page
  And I wait for "4" seconds
  And I verify all checkboxes are checked
  And I click the "new_ui_blue_button_inner" div
  And I click the "Logout" link
  
  And I login with "rdownie+pa@qamail1.rollstream.com"
  And I am on my company page
  And I click the "Edit Company" div
  And I wait for "4" seconds
  And I select "two" from "1"
  And I click the "SAVE CHANGES" div
  And I wait for "4" seconds
  And I fill in the text field "request_reason" with "Testing"
  And I click the "OK" div
  And I wait for "4" seconds
  Then I should see the text "Edit Company Request successfully submitted."
  And I click the "Logout" link
  
  Given I login with "rdownie@qamail1.rollstream.com"
  And I am on the change management page
  And I click row "2" in the "onboarding_list" table
  And I wait for "4" seconds
  And I click the "Approve Request" div
  And I wait for "4" seconds
  And I click the "_button" div
  And I wait for "4" seconds
  And I click the "Logout" link
  
  And I login with "rdownie+pa@qamail1.rollstream.com"
  And I am on my company page
  Then I should see the text "two"

@firefox
Scenario: Web Forms Collect Contacts  
	And I reset projects and activities
  Given I add a "Send a Message" activity to an existing project
	And I click row "1" in the "list" table
	And I click the "WEB FORMS" div
	And I click the "new_ui_blue_button_inner" div
	And I fill in the text field "1" with "Company Form"
	And I click the "SAVE CHANGES" div
	And I wait for "3" seconds
	And I click the "Add Question" link
	And I wait for "5" seconds
  And I select "Collect Contacts" from "1"
  And I click the "Next" button
  And I wait for "3" seconds
  And I click the "2" radio button
  And I wait for "3" seconds
  And I verify all checkboxes are checked
  And I click the "2" button
  And I wait for "3" seconds
  And I click the "new_ui_blue_button_outer" div
  And I wait for "3" seconds
  And I click the "Test" div
  And I wait for "3" seconds
  And I click the "ADD CONTACT" div
  And I wait for "6" seconds
  And I fill in the text field "person_first_name" with random "Kris"
  And I fill in the text field "person_last_name" with random "Joseph"
  And I fill in the collect contacts email field
  And I click the "SAVE CHANGES" div
   And I wait for "5" seconds
   And I click the "Hub Participant" link
   And I wait for "3" seconds
   Then I should see the text "Disable Contact"
   And I fill in the text field "person_title" with random "BigEast"
   And I click the "SAVE CHANGES" div
   And I wait for "3" seconds
   And I click the "Save" div
   And I wait for "5" seconds
   And I click the "new_ui_system_button_outer" div
   And I wait for "5" seconds
   And I click the "Publish" div
   And I wait for "5" seconds
   And I click the "Logout" link