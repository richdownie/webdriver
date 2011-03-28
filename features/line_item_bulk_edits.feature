@firefox
Feature: Search/Update and Unauthorized scenarios

Background:
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I am on the Issues page
  And I click the "ADMIN" div
  And I click the "Shipping Dispute" link
  And I click the "Click Here" link
  And I click the "Save" button
  And I click the "Text Field" under "issue_links"
  And I fill in the text field "1" with "Form Color?"
  And I verify all checkboxes are unchecked
  And I click the "question_issue_field_authorizations_attributes_0_editable" checkbox
  And I click the "Add Field" button
  And I click the "Drop-List Field" under "line_item_links"
  And I fill in the text field "1" with "Line Item Drop List"
  And I fill in the text field "3" with "one"
  And I fill in the text field "4" with "one"
  And I fill in the text field "5" with "two"
  And I fill in the text field "6" with "two"
  And I verify all checkboxes are unchecked
  And I click the "question_issue_field_authorizations_attributes_0_editable" checkbox
  And I click the "Add Field" button
  And I click the "Text Field" under "line_item_links"
  And I fill in the text field "1" with "Line Item Color?"
  And I select "Line Item Drop List" from "question_dependent_on_question_id"
  And I wait for "5" seconds
  And I select "two" from "question_dependency_answers"
  And I verify all checkboxes are unchecked
  And I click the "question_issue_field_authorizations_attributes_0_editable" checkbox
  And I click the "Add Field" button
  And I click the "ADD ISSUES" div
  And I select "Owens & Minor" from "issue_responder_id"
  And I fill in the text field "1" with "Purple"
  And I select "one" from "issue_line_items_attributes_0_form_response_attributes_answers_attributes_0_value"
  And I click the "SAVE" button
  And I click the "ADD ISSUES" div
  And I select "PING" from "issue_responder_id"
  And I fill in the text field "1" with "Black"
  And I select "one" from "issue_line_items_attributes_0_form_response_attributes_answers_attributes_0_value"
  And I click the "SAVE" button
  And I click the "Logout" link

Scenario: Mediator can Bulk Edit  
  Given I login with "rdownie+jmediator@qamail1.rollstream.com"
  And I am on the Issues page
  And I click the "MANAGE LINE ITEMS" div
  And I select "Edit" from "bulkOperations"
  And I verify all checkboxes are checked
  And I click the "Update" link
  And I click the "1" checkbox
  And I click the "Proceed With Update" button
  And I click the "Logout" link

Scenario: Manager cannot Bulk Edit
  Given I login with "rdownie+jmanager@qamail1.rollstream.com"
  And I am on the Issues page
  And I click the "MANAGE LINE ITEMS" div
  And I select "Edit" from "bulkOperations"
  And I verify all checkboxes are checked
  And I click the "Update" link
  Then I should find the "line_item_form_response_attributes_answers_attributes_0_value" select list disabled
  And I click the "Logout" link
  
Scenario: Bulk update as Hub Mediator dependent field    
  Given I login with "rdownie+hmediator@qamail1.rollstream.com"
  And I am on the Issues page
  And I click the "MANAGE LINE ITEMS" div
  And I select "Edit" from "bulkOperations"
  And I verify all checkboxes are checked
  And I click the "Update" link
  And I verify all checkboxes are checked
  And I select "two" from "line_item_form_response_attributes_answers_attributes_0_value"
  And I wait for "4" seconds
  And I fill in the text field "line_item_form_response_attributes_answers_attributes_1_value" with "Upstate44"
  And I click the "Proceed With Update" button
  And I wait for "3" seconds
  Then I click the "Open" link
  And I wait for "3" seconds
  Then I should see the text "two"
  Then I should see the text "Upstate44"
  And I click the "Logout" link

Scenario Outline: Bulk Update as Participants  
  And I login with "rdownie@qamail1.rollstream.com"
  And I am on the Issues page
  And I click the "ADMIN" div
  And I click the "Shipping Dispute" link
  And I click the Edit Link Text Column for Line Items
  And I click the "question_issue_field_authorizations_attributes_0_editable" checkbox
  And I click the <checkbox> checkbox
  And I click the "Update Field" button
  And I click the "Logout" link
  And I login with <originator>
  And I am on the Issues page
  And I click the "MANAGE LINE ITEMS" div
  And I verify all checkboxes are checked
  And I select "Edit" from "bulkOperations"
  And I click the "Update" link
  And I click the "1" checkbox
  And I click the "Proceed With Update" button
  Then I should see the text <result>
  And I login with <participant>
  And I am on the Issues page
  And I verify all checkboxes are checked
  And I select "" from "bulkOperations"
  
  Examples:
  | checkbox                                                    | originator                                    | participant                                   | result                                   |
  | "question_issue_field_authorizations_attributes_3_editable" | "rdownie+hparticipant@qamail1.rollstream.com" | "rdownie+jparticipant@qamail1.rollstream.com" | "2 line items were successfully updated" |
  
