@firefox
Feature: Implement cucumber stories for adding & editing issues that include file upload fields

Scenario: Setup
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I am on the Issues page
  And I click the "ADMIN" div
  And I click the "Shipping Dispute" link
  And I click the "Issue Custom Fields" link
  And I click the "File Upload" link
  And I fill in the text field "question_label" with "Issue File Upload Field"
  And I click the "SAVE" link
  And I am on the Issues page
  And I click the "ADMIN" div
  And I click the "Shipping Dispute" link
  And I click the "Line Item Custom Fields" link
  And I click the "File Upload" link
  And I fill in the text field "question_label" with "Line Item File Upload Field""
  And I click the "SAVE" link

Scenario: Add Issue with Uploads 
  Given I am on the new issues page
  And I select "Owens & Minor" from "1"
  And I upload "issue_import.csv" to the "issue_form_response_attributes_answers_attributes_0_value" file field
  And I upload "issue_import.csv" to the "issue_line_items_attributes_0_form_response_attributes_answers_attributes_0_value" file field
  And I click the "issue_submit" button
  
Scenario: Delete/Edit upload in line_item show and Bulk Update
  And I click the "1" link
  And I click the "Edit" link
  And I wait for "2" seconds
  And I click the "icon delete js_delete_file_upload" span
  And I wait for "4" seconds
  And I click the "SAVE" button
  And I wait for "4" seconds
  And I click the "Edit" link
  And I wait for "4" seconds
  And I upload "Companies.xls" to the "line_item_form_response_attributes_answers_attributes_0_value" file field
  And I wait for "4" seconds
  And I click the "SAVE" button
  And I click the "MANAGE LINE ITEMS" link
  And I click the "enableAllCheckbox" checkbox
  And I select "Edit" from "bulkOperations"
  And I click the "Update" link
  And I verify all checkboxes are checked
  And I upload "Companies.xls" to the "line_item_form_response_attributes_answers_attributes_0_value" file field
  And I click the "PROCEED WITH UPDATE" button
  And I click the "Companies.xls" link
  And I click the "enableAllCheckbox" checkbox
  And I select "Edit" from "bulkOperations"
  And I click the "Update" link
  And I verify all checkboxes are checked
  And I click the "PROCEED WITH UPDATE" button
  Then I should NOT see the text "Companies.xls"