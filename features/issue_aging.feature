@set1
Feature: Issue Type Security

Scenario: Setup
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I am on the Issues page
  And I click the "ADMIN" div
  And I click the "Create Issue Type" link
  And I fill in the text field "1" with "Pricing"
  And I fill in the text field "2" with "PR-44"
  And I fill in the text field "3" with "ladf"
  And I click the "Save" button
  Then I should see the text "is not a number"
  And I fill in the text field "4" with "#$##W%"
  And I click the "Save" button
  Then I should see the text "is not a number"
  And I fill in the text field "3" with "1"
  And I fill in the text field "4" with "1"
  And I fill in the text field "5" with "rdownie@rollstream.com"
  And I fill in the text field "6" with "rich@richdownie.com"
  And I click the "Save" button
  And I click the "Issue Custom Fields" link
  And I click the "Text" link
  And I fill in the text field "question_label" with "Form Question"
  And I click the "SAVE" link
  And I am on the Issues page
  And I click the "ADMIN" div
  And I click the "Pricing" link
  And I click the "Line Item Custom Fields" link
  And I click the "Text" link
  And I fill in the text field "question_label" with "Line Item Question"
  And I click the "SAVE" link
  And I click the "ADD ISSUES" link
  # And I click the "Pricing" link
  And I select "Owens & Minor" from "issue_responder_id"
  And I fill in the text field "1" with "Red"
  And I fill in the text field "2" with "Blue"
  And I click the "issue_submit" button
  
Scenario: Verify Earmark Displays in list
  Then I verify Earmark Table Row exists
  
Scenario: Verify Earmark Displays in Show
  And I click cell "3" row "2" in the "result-list issues scrollable" table
  Then I verify Earmark displays on Show page
  
Scenario: Verify Earmark is removed when Resolved
  And I click the "Resolve" link
  And I wait for "5" seconds
  And I am on the issues page
  And I wait for "5" seconds
  And I click the "MANAGE LINE ITEMS" div
  And I wait for "5" seconds
  And I verify Earmark Table Row does NOT exist
  And I click the "Logout" link
  