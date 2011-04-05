@set3
Feature: General Issue Scenarios

Background: Go to Import Page as Community Administrator with a clean slate
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data

Scenario: Import a Valid Issue CSV
  And I am on the Issues page
  And I setup the issue type
  And I am on the new issues page
  And I click the "Import" link
  And I upload "issue_import.csv" to the "import_uploaded_data" file field
  And I click the "Next" link
	And I wait for "2" seconds
  And I click the "Next" link
	And I wait for "2" seconds
	Then I should see the text "Blue"
	Then I should see the text "Red"
  And I click the "Next" link
	And I wait for "2" seconds
  And I click the "Go to Line Items." link
	And I wait for "2" seconds
	Then I should see the text "Shipping Dispute"
  And I click the "Logout" link
  
Scenario: Only allow mapping to editable fields for the creator 
  And I am on the Issues page
  And I setup the issue type 
  Given I am on the issue types Admin page
  And I click the "Shipping Dispute" link
  And I click the "Issue Custom Fields" link
  And I click the "Text" link
  And I fill in the text field "question_label" with "Form Question"
  And I verify all checkboxes are unchecked
  And I click the "question_issue_field_authorizations_attributes_2_editable" checkbox
  And I click the "SAVE" link
  And I click the "Logout" link
  Given I login with "rdownie+jcreator@qamail1.rollstream.com"
  And I am on the new issues page
  And I click the "Import" link
  And I wait for "2" seconds
  And I upload "issue_import.csv" to the "import_uploaded_data" file field
  And I click the "Next" link
  And I wait for "2" seconds
  And I click the "Next" link
  And I wait for "2" seconds
  And I click the "Next" link
	And I wait for "2" seconds
  And I click the "Go to Line Items." link
	And I wait for "2" seconds
	Then I should see the text "Shipping Dispute"
  And I click the "Logout" link

Scenario: Import an Invalid Issue CSV
  And I am on the Issues page
  And I setup the issue type
  And I am on the new issues page
  And I click the "Import" link
  And I wait for "2" seconds
  And I upload "invalid_issue_import.csv" to the "import_uploaded_data" file field
  And I click the "Next" link
  And I click the "Next" link
  And I wait for "5" seconds
  Then I should see the text "Reporter Email Address is required"
  Then I should see the text "Company ID is required"
  And I click the "Logout" link

Scenario: Import an Issue XLS
  And I am on the Issues page
  And I setup the issue type
  And I am on the new issues page
  And I click the "Import" link
  And I wait for "2" seconds
  And I upload "issue_import.xls" to the "import_uploaded_data" file field
  And I click the "Next" link
  And I click the "Next" link
  And I wait for "2" seconds
  Then I should see the text "There are problems with the import file. Please be sure the file is in a comma separated values (CSV) format."
  And I click the "Logout" link
  
Scenario: csv with Issue Custom Dependent Fields as hcreator verify responding mediator sees on todo and hmanager cannot resolve with nil required
#CA Setup of IssueType for import csv  
  And I am on the issue types Admin page
  And I click the "Shipping Dispute" link
  And I click the "Issue Custom Fields" link
  And I click the "Drop List" link
  And I wait for "2" seconds
  And I fill in the text field "question_label" with "Parent Issue Question"
  And I fill in the text field "question_choices_attributes_0_label" with "one"
  And I fill in the text field "question_choices_attributes_1_label" with "two"
  And I fill in the text field "question_choices_attributes_2_label" with "three"
  And I wait for "2" seconds
  And I click the "SAVE" link
  And I wait for "2" seconds
  
  And I click the "Shipping Dispute" link
  And I click the "Issue Custom Fields" link
  And I click the "Text" link
  And I fill in the text field "question_label" with "Child Issue Question"
  And I click the "question_required" checkbox
  And I click the "js_dependency" checkbox
  And I wait for "2" seconds
  And I click the "1" radio button
  And I wait for "2" seconds  
  And I click the "question_dependency_answers_1" checkbox
  And I click the "SAVE" link
  And I click the "Shipping Dispute" link
  And I click the "Line Item Custom Fields" link
  And I click the "Drop List" link
  And I fill in the text field "1" with "Parent Line Item Question"
  And I fill in the text field "question_choices_attributes_0_label" with "four"
  And I fill in the text field "question_choices_attributes_1_label" with "five"
  And I fill in the text field "question_choices_attributes_2_label" with "six"
  And I click the "SAVE" link
  And I click the "Text" link
  And I fill in the text field "1" with "Child Line Item Question"
  And I click the "question_required" checkbox
  And I click the "js_dependency" checkbox
  And I wait for "2" seconds
  And I click the "1" radio button
  And I wait for "2" seconds  
  And I click the "question_dependency_answers_1" checkbox
  And I click the "SAVE" link
  And I click the "Logout" link
#originating creator logs in and maps import of csv
  And I login with "rdownie+hcreator@qamail1.rollstream.com"
  And I am on the new issues page
  And I click the "Import" link
  And I wait for "2" seconds
  And I upload "required_dependents.csv" to the "import_uploaded_data" file field
  And I click the "Next" link
  And I wait for "2" seconds
  And I click the "Next" link
  And I wait for "2" seconds
  And I click the "Next" link
  And I wait for "2" seconds
  And I click the "Go to Line Items." link
  And I click the "Logout" link
#responder mediator logs in and makes sure New imported line item displays properly in Open status on todo page
  And I login with "rdownie+jmediator@qamail1.rollstream.com"
  And I am on the issues home tab page
  And I click the "View" link
  And I click the "Logout" link
#originator manager is unable to resolve line item with nil in required dependent field
  And I login with "rdownie+hmanager@qamail1.rollstream.com"
  And I am on the issues page
  And I click the "MANAGE LINE ITEMS" div
  And I click the "1" link
  And I click the "Resolve" link
  And I wait for "2" seconds
  And I should see the text "be blank"
  And I fill in the text field "2" with "Resolve it"
  And I click the "commit" button
  And I wait for "2" seconds
  And I click the "Resolve" link
  And I wait for "2" seconds
  And I should see the text "The line item status has been changed to Resolved"          