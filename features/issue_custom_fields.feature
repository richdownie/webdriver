Feature: General Issue Custom Field Scenarios

Background:
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  
@set3
Scenario: Standard Edit Role Check between Manager and Mediator
  And I am on the Issues page
  And I wait for "4" seconds
  And I click the "ADMIN" div
  And I click the "Shipping Dispute" link
  And I click the "Issue Custom Fields" link
  And I click the "Text" link
  And I fill in the text field "1" with "Form Color?"
  And I verify all checkboxes are unchecked
  And I click the "1" checkbox
  And I click the "SAVE" link
  Given I am on the issue types Admin page
  And I click the "Shipping Dispute" link
  And I click the "Line Item Custom Fields" link
  And I click the "Text" link
  And I fill in the text field "1" with "Line Item Color?"
  And I verify all checkboxes are unchecked
  And I click the "1" checkbox
  And I click the "SAVE" link
  And I am on the issues page
  And I add an issue with company "Owens & Minor" with color "Red"
  Given I login with "rdownie+jmanager@qamail1.rollstream.com"
  And I am on the issues page
  And I click the "Open(1)" link
  And I click cell "3" row "2" in the "result-list issues scrollable" table
  And I click the "Edit" link
  And I wait for "2" seconds
  And I fill in the text field "line_item_form_response_attributes_answers_attributes_0_value" with "UpdatedRed"
  And I click the "SAVE" button
  And I wait for "2" seconds
  Then I should see the text "UpdatedRed"
  And I click the "Logout" link

@firefox @lineitems
Scenario: Add Multiple Dependent Fields
  And I am on the Issues page
  And I click the "ADMIN" div
  And I click the "Shipping Dispute" link
  And I click the "Issue Custom Fields" link
  And I click the "Drop List" link
  And I fill in the text field "1" with "Issue Parent DL"
  And I fill in the text field "question_choices_attributes_0_label" with "one"
  And I fill in the text field "question_choices_attributes_1_label" with "two"
  And I fill in the text field "question_choices_attributes_2_label" with "three"
  And I click the "SAVE" link
  And I click the "Text" link
  And I fill in the text field "1" with "Issue Child Value"
  And I click the "js_dependency" checkbox
  And I click the "1" radio button
  And I wait for "3" seconds
  And I click the "question_dependency_answers_1" checkbox
  And I click the "2" radio button
  And I wait for "5" seconds
  And I click the "js_dependency" checkbox
  And I click the "SAVE" link
  
  And I click the "ADMIN" link
  And I click the "Shipping Dispute" link
  And I click the "Line Item Custom Fields" link
  And I click the "Drop List" link
  And I fill in the text field "1" with "LineItem Parent DL"
  And I fill in the text field "question_choices_attributes_0_label" with "four"
  And I fill in the text field "question_choices_attributes_1_label" with "five"
  And I fill in the text field "question_choices_attributes_2_label" with "six"
  And I click the "SAVE" link
  And I click the "Text" link
  And I fill in the text field "1" with "LineItem Child Value"
  And I click the "js_dependency" checkbox
  And I click the "1" radio button
  And I wait for "3" seconds
  And I click the "question_dependency_answers_1" checkbox
  And I click the "2" radio button
  And I wait for "5" seconds
  And I click the "five" checkbox
  And I click the "SAVE" link
  And I click the "ADD ISSUES" link
  And I select "Owens & Minor" from "issue_responder_id"
  And I select "one" from "2"
  And I wait for "5" seconds
  And I select "four" from "4"
  And I click the "SAVE" button
  
  And I wait for "2" seconds 
  And I click cell "3" row "2" in the "result-list issues scrollable" table
  And I click the "Edit" link
  And I wait for "2" seconds
  And I select "five" from "1"
  And I wait for "2" seconds
  And I fill in the text field "2" with "Updated LineItem Child"
  And I click the "SAVE" button
  And I wait for "2" seconds
  And I click the "MANAGE LINE ITEMS" link
  Then I should see the text "Updated LineItem Child"
  And I click the "Logout" link
  
@wip
Scenario: Validation Check on Required Children
  And I am on the Issues page
  And I click the "ADMIN" div
  And I click the "Shipping Dispute" link
  And I click the "Issue Custom Fields" link
  And I select "Drop List" from "custom_field_kinds"
  And I wait for "4" seconds
  And I fill in the text field "question_label" with "Issue Parent DL"
  And I fill in the text field "question_choices_attributes_0_label" with "one"
  And I fill in the text field "question_choices_attributes_1_label" with "two"
  And I fill in the text field "question_choices_attributes_2_label" with "three"
  And I wait for "2" seconds
  And I click the "primary" link
  
  # And I select "Text" from "custom_field_kinds"
  # And I wait for "2" seconds
  # And I fill in the text field "question_label" with "Issue Child Value"
  # And I click the "question_field_depedency" checkbox
  # And I wait for "2" seconds
  # And I click the "1" radio button
  # And I wait for "2" seconds
  # And I click the "question_dependency_answers_one" checkbox
  # And I click the "question_dependency_answers_two" checkbox
  # And I click the "DONE" link
  
  
  
  # And I select "two" from "2"
  # And I click the "question_required" checkbox
  # And I click the "SAVE" link

  # And I click the "Drop-List Field" under "line_item_links"
  # And I fill in the text field "1" with "LineItem Parent DL"
  # And I fill in the text field "3" with "four"
  # And I fill in the text field "5" with "five"
  # And I fill in the text field "7" with "six"
  # And I click the "Add Field" button
  # And I click the "Text Field" under "line_item_links"
  # And I fill in the text field "1" with "LineItem Child Value"
  # And I select "LineItem Parent DL" from "question_dependent_on_question_id"
  # And I wait for "5" seconds
  # And I select "five" from "question_dependency_answers"
  # And I click the "question_required" checkbox
  # And I click the "Add Field" button
  # 
  # And I click the "ADD ISSUES" div
  # And I select "Owens & Minor" from "issue_responder_id"
  # And I select "two" from "2"
  # And I wait for "5" seconds
  # And I select "five" from "4"
  # And I click the "SAVE" button
  # And I click row "2" in the "result-list issues scrollable" table
  # And I click the "Resolve" link
  # And I wait for "5" seconds
  # Then I should see the text "The line item status could not be set to Resolved:"
  # Then I should see the text "LineItem Child Value is required and a value was not provided"
  # And I click the "Edit" link
  # And I wait for "5" seconds
  # Then I should NOT see the text "LineItem Child Value is required and a value was not provided"
  # And I fill in the text field "line_item_form_response_attributes_answers_attributes_1_value" with "UpdatedLineItem"
  # And I click the "SAVE" button
  # And I wait for "2" seconds
  # And I click the "Resolve" link
  # And I wait for "5" seconds
  # Then I should see the text "The line item status has been changed to Resolved"
  # And I click the "Close" link
  # And I wait for "5" seconds
  # Then I should see the text "The line item status has been changed to Closed"
  # And I click the "Logout" link