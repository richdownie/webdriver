@set2
Feature: Test all transitions via bulk update

Scenario: Setup IssueType
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I am on the issue types Admin page
  And I click the "Shipping Dispute" link
  And I click the "Issue Custom Fields" link
  And I click the "Text" link
  And I fill in the text field "1" with "SD-Issue Question?"
  And I click the "SAVE" link
  Given I am on the issue types Admin page
  And I click the "Shipping Dispute" link
  And I click the "Line Item Custom Fields" link
  And I click the "Text" link
  And I fill in the text field "1" with "SD-Line Item Question?"
  And I click the "SAVE" link
  And I click the "Logout" link
  
Scenario Outline: An originating manager can move a line item directly to Closed from Pending or Open
  Given I login with "rdownie@qamail1.rollstream.com"
  Given I destroy these issues
  And I am on the Issues page
  And I click the "ADD ISSUES" div
  And I select "Owens & Minor" from "1"
  And I fill in the text field "1" with "SD-Issue"
  And I fill in the text field "2" with "SD-Closed"
  And I fill in the text field "3" with "1/1/2000"
  And I fill in the text field "4" with "SD-Pending"
  And I fill in the text field "5" with "1/1/2020"
  And I fill in the text field "6" with "SD-Resolved"
  And I fill in the text field "8" with "SD-Open"
  And I fill in the text field "9" with "1/1/2000"
  And I click the "SAVE" button
  And I wait for "3" seconds
  And I create all line item stati
  And I click the "Logout" link
  Given <user> should be able to <update> a <current> line item and see <result>
  Given I destroy these issues
  And I click the "Logout" link
  
  Examples:
  | user                                        | update          | current      | result                 |
  | "rdownie+hmanager@qamail1.rollstream.com "  | "Mark Resolved" | "Open(1)"    | "successfully updated" |
  | "rdownie+hmanager@qamail1.rollstream.com "  | "Mark Closed"   | "Pending(1)" | "successfully updated" |
  | "rdownie+hmanager@qamail1.rollstream.com "  | "Mark Closed"   | "Open(1)"    | "successfully updated" |
  | "rdownie+hmediator@qamail1.rollstream.com " | "Mark Resolved" | "Open(1)"    | "successfully updated" |
  | "rdownie+jmanager@qamail1.rollstream.com "  | "Mark Resolved" | "Open(1)"    | "not authorized" |
  | "rdownie+jmanager@qamail1.rollstream.com "  | "Mark Closed"   | "Pending(1)" | "not authorized" |
  | "rdownie+jmanager@qamail1.rollstream.com "  | "Mark Closed"   | "Open(1)"    | "not authorized" |
  | "rdownie+jmediator@qamail1.rollstream.com " | "Mark Resolved" | "Open(1)"    | "not authorized" |
  
  