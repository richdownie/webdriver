@set1
Feature: Issue Type Security

Scenario: Setup
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I am on the issue types Admin page
  And I click the "Create Issue Type" link
  And I fill in the text field "issue_type_name" with "Pricing"
  And I fill in the text field "issue_type_abbreviation" with "PR-44"
  And I fill in the text field "issue_type_default_interval_due" with "ladf"
  And I click the "Save" button
  Then I should see the text "is not a number"
  And I fill in the text field "issue_type_days_before_due" with "#$##W%"
  And I click the "Save" button
  Then I should see the text "is not a number"
  And I fill in the text field "issue_type_default_interval_due" with "1"
  And I fill in the text field "issue_type_days_before_due" with "1"
  And I fill in the text field "issue_type_from" with "rdownie@rollstream.com"
  And I fill in the text field "issue_type_reply_to" with "rich@richdownie.com"
  And I click the "Save" button
  And I click the "Issue Custom Fields" link
  And I click the "Manage Custom Fields" link
  And I click the "Text" link
  And I fill in the text field "question_label" with "Form Question"
  And I click the "SAVE" link
  And I click the "Pricing" link
  And I click the "Line Item Custom Fields" link
  And I click the "Manage Custom Fields" link
  And I click the "Text" link
  And I fill in the text field "question_label" with "Line Item Question"
  And I click the "SAVE" link
  And I am on the new issues page
  # # And I click the "Pricing" link
  And I select "Owens & Minor" from "issue_responder_id"
  And I fill in the text field "issue_form_response_attributes_answers_attributes_0_value" with "Red"
  And I fill in the text field "issue_line_items_attributes_0_form_response_attributes_answers_attributes_0_value" with "Blue"
  And I click the "issue_submit" button
  
Scenario: Verify Earmark Displays in list
  Then I verify Earmark Table Row exists
  
Scenario: Verify Earmark Displays in Show
  And I click cell "2" row "1" in the "result-list issues scrollable" table
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
  