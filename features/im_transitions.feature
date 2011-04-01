@set2
Feature: Test all transitions via bulk update

Scenario: Setup IssueType
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I am on the issue types Admin page
  And I click the "Shipping Dispute" link
  And I click the "Issue Custom Fields" link
  And I click the "Manage Custom Fields" link
  And I click the "Text" link
  And I fill in the text field "question_label" with "SD-Issue Question?"
  And I click the "SAVE" link
  Given I am on the issue types Admin page
  And I click the "Shipping Dispute" link
  And I click the "Line Item Custom Fields" link
  And I click the "Manage Custom Fields" link
  And I click the "Text" link
  And I fill in the text field "question_label" with "SD-Line Item Question?"
  And I click the "SAVE" link
  And I click the "Logout" link
  
Scenario: An originating manager can move a line item directly to Closed from Pending or Open  
# Scenario Outline: An originating manager can move a line item directly to Closed from Pending or Open
  Given I login with "rdownie@qamail1.rollstream.com"
  Given I destroy these issues
  And I am on the new issues page
  And I select "Owens & Minor" from "issue_responder_id"
  And I fill in the text field "issue_form_response_attributes_answers_attributes_0_value" with "SD-Issue"
  And I fill in the text field "issue_line_items_attributes_0_form_response_attributes_answers_attributes_0_value" with "SD-Closed"
  And I fill in the text field "issue_line_items_attributes_0_due_date" with "1/1/2000"
  And I fill in the text field "issue_line_items_attributes_1_form_response_attributes_answers_attributes_0_value" with "SD-Pending"
  And I fill in the text field "issue_line_items_attributes_1_due_date" with "1/1/2020"
  And I fill in the text field "issue_line_items_attributes_2_form_response_attributes_answers_attributes_0_value" with "SD-Resolved"
  And I fill in the text field "issue_line_items_attributes_3_form_response_attributes_answers_attributes_0_value" with "SD-Open"
  And I fill in the text field "issue_line_items_attributes_3_due_date" with "1/1/2000"
  And I click the "SAVE" button
  And I wait for "3" seconds
  And I create all line item stati
  And I click the "Logout" link
  # Given <user> should be able to <update> a <current> line item and see <result>
  Given I login with "rdownie+hmanager@qamail1.rollstream.com"
  And I am on the shipping issue line items page
  And I click cell "1" row "2" in the "result-list issues scrollable" table
  # And I click the "4" link
  # And I select "Mark Resolved" from "bulkOperations"
  # And I click the "enableAllCheckbox" checkbox
  # And I click the "Update" link
  # And I click the "Proceed With Update" button
  # Then I should see the text "successfully updated}"
  # Given I destroy these issues
  # And I click the "Logout" link
  
  # Examples:
  # | user                                        | update          | current      | result                 |
  # | "rdownie+hmanager@qamail1.rollstream.com "  | "Mark Resolved" | "Open(1)"    | "successfully updated" |
  # # | "rdownie+hmanager@qamail1.rollstream.com "  | "Mark Closed"   | "Pending(1)" | "successfully updated" |
  # # | "rdownie+hmanager@qamail1.rollstream.com "  | "Mark Closed"   | "Open(1)"    | "successfully updated" |
  # # | "rdownie+hmediator@qamail1.rollstream.com " | "Mark Resolved" | "Open(1)"    | "successfully updated" |
  # # | "rdownie+jmanager@qamail1.rollstream.com "  | "Mark Resolved" | "Open(1)"    | "not authorized" |
  # # | "rdownie+jmanager@qamail1.rollstream.com "  | "Mark Closed"   | "Pending(1)" | "not authorized" |
  # # | "rdownie+jmanager@qamail1.rollstream.com "  | "Mark Closed"   | "Open(1)"    | "not authorized" |
  # # | "rdownie+jmediator@qamail1.rollstream.com " | "Mark Resolved" | "Open(1)"    | "not authorized" |
  
  