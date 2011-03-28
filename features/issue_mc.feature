@set1
Feature: New Multiple Choice Functionality

Scenario: Setup
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I am on the issue types Admin page
  And I click the "Shipping Dispute" link
  And I click the "Issue Custom Fields" link
  And I click the "Multiple Choice" link
  And I fill in the text field "1" with "Multiple Choice Issue Question"
  And I fill in the text field "question_choices_attributes_0_label" with "one"
  And I fill in the text field "question_choices_attributes_0_value" with "one"
  And I fill in the text field "question_choices_attributes_1_label" with "two"
  And I fill in the text field "question_choices_attributes_1_value" with "two"
  And I fill in the text field "question_choices_attributes_2_label" with "three"
  And I fill in the text field "question_choices_attributes_2_value" with "three"
  And I click the "SAVE" link
  And I click the "Text" link
  And I fill in the text field "1" with "Issue Child Dependent Text"
  And I click the "2" radio button
  And I wait for "3" seconds
  And I click the "2" checkbox
  And I click the "SAVE" link 
  
  And I am on the issue types Admin page
  And I click the "Shipping Dispute" link
  And I click the "Line Item Custom Fields" link
  And I click the "Multiple Choice" link
  And I fill in the text field "1" with "Multiple Choice Line Item Question"
  And I fill in the text field "question_choices_attributes_0_label" with "one"
  And I fill in the text field "question_choices_attributes_0_value" with "one"
  And I fill in the text field "question_choices_attributes_1_label" with "two"
  And I fill in the text field "question_choices_attributes_1_value" with "two"
  And I fill in the text field "question_choices_attributes_2_label" with "three"
  And I fill in the text field "question_choices_attributes_2_value" with "three"
  And I click the "SAVE" link
  And I click the "Text" link
  And I fill in the text field "1" with "Line Item Child Dependent Text"
  And I click the "2" radio button
  And I wait for "3" seconds
  And I click the "2" checkbox
  And I click the "SAVE" link

Scenario: Add lines and issues with MC fields through "Add Issue"
  Given I am on the new issues page
  And I wait for "1" seconds
  And I select "Owens & Minor" from "1"
  And I wait for "1" seconds
  And I click the "1" button
  And I wait for "3" seconds
  And I click the "Check all" link
  And I wait for "4" seconds
  And I click the "4" button
  And I wait for "3" seconds
  And I click the "1" checkbox
  And I click the "2" checkbox
  And I click the "3" checkbox
  And I click the "SAVE" button
  And I click the "1" link
  
Scenario Outline: Display MC fields on Manage Line Items page
  And I am on the issues page
  And I wait for "3" seconds
  And I click the <tab> div
  Then I should see the text <result>
  
  Examples:
  | tab                 | result                               |
  | "MANAGE LINE ITEMS" | "Multiple Choice Line Item Question" |
  | "MANAGE ISSUES"     | "Multiple Choice Issue Question"     |
  
Scenario: Display MC fields on line_item/show
  Given I login with "rdownie@qamail1.rollstream.com"
  And I am on the issues home tab page
  And I click "1" link in "c-1 summary"
  And I click the "1" link
  Then I should see the text "Multiple Choice Line Item Question"
  Then I should see the text "Multiple Choice Issue Question"

#timing issue with IE - removing for now
# Scenario: Bulk Edit lines that include MC fields
#   Given I login with "rdownie@qamail1.rollstream.com"
#   And I am on the issues home tab page
#   And I click "1" link in "c-1 summary"
#   And I select "Edit" from "bulkOperations"
#   And I click the "enableAllCheckbox" checkbox
#   And I click the "Update" link
#   And I verify all checkboxes are checked
#   And I fill in the text field "2" with "editing child dependencies"
#   And I click the "PROCEED WITH UPDATE" button
#   Then I should see the text "editing child dependencies"
  
Scenario: Import of MC fields into issues
  Given I login with "rdownie@qamail1.rollstream.com"
  And I am on the Issues page
  And I am on the new issues page
  And I click the "Import" link
  And I wait for "5" seconds
  And I upload "import_mc_to_im.csv" to the "import_uploaded_data" file field
  And I click the "Next" link
  And I wait for "6" seconds
  And I click the "Next" link
  And I wait for "6" seconds
  And I click the "Next" link
  And I wait for "6" seconds
  And I click the "Go to Line Items." link
  And I click the "Logout" link