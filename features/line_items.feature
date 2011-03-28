@set3
Feature: Line_Item flow Scenarios

Background: Create Shipping Issue Type
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I am on the Issues page
  And I click the "ADMIN" div
  And I click the "Shipping Dispute" link
  And I click the "Issue Custom Fields" link
  And I click the "Text" link
  And I fill in the text field "1" with "Form Color?"
  And I click the "SAVE" link
  And I click the "ADMIN" link
  And I click the "Shipping Dispute" link
  And I click the "Line Item Custom Fields" link
  And I click the "Text" link
  And I fill in the text field "1" with "Line Item Color?"
  And I click the "SAVE" link

Scenario:  Navigate through line items widget
  And I am on the issues page
  And I click the "ADD ISSUES" div
  And I select "Owens & Minor" from "issue_responder_id"
  And I fill in the text field "1" with "Navigate"
  And I fill in the text field "2" with "One"
  And I fill in the text field "4" with "Two"
  And I fill in the text field "6" with "Three"
  And I fill in the text field "8" with "Four"
  And I click the "issue_submit" button
  And I click the "1" link
  And I click the "MANAGE LINE ITEMS" link
  And I click the "1" link