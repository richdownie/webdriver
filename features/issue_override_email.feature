@firefox
Feature: Issue Type Security

Scenario: Setup
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I am on the issue types Admin page
  And I click the "Create Issue Type" link
  And I fill in the text field "1" with "Pricing"
  And I fill in the text field "2" with "PR-44"
  And I fill in the text field "3" with "30"
  And I fill in the text field "4" with "7"
  And I fill in the text field "5" with "@#;lkj.dslfk@-@com"
  And I fill in the text field "6" with "@#;lkj.dslfk@-@com"
  And I click the "Save" button
  Then I should see the text "is not a valid email address"
  And I fill in the text field "5" with "richdownie@gmail.com"
  And I fill in the text field "6" with "rich@richdownie.com"
  And I click the "Save" button
  And I click the "Issue Custom Fields" link
  And I click the "Text" link
  And I fill in the text field "question_label" with "Form Question?"
  And I click the "SAVE" link
  Given I am on the issue types Admin page
  And I click the "Pricing" link
  And I click the "Line Item Custom Fields" link
  And I click the "Text" link
  And I fill in the text field "1" with "Line Item Question?"
  And I click the "SAVE" link
  And I click the "ADD ISSUES" link
  # And I click the "Pricing" link
  And I select "Owens & Minor" from "issue_responder_id"
  And I fill in the text field "1" with "Red"
  And I fill in the text field "2" with "Blue"
  And I click the "SAVE" button
  
Scenario Outline: Verify Creator
  Given I am on the issues page
  Then I make sure Search criteria is displayed
  And I wait for "4" seconds
  And I click the "search_issue_creator_email" checkbox
  And I fill in the text field "search_for_issue_creator_email" with <creator>
  And I click the "Search" button
  And I wait for "3" seconds
  Then I should see the text <message>
  
  Examples:
  | creator                           | message            |
  | "rdownie@qamail1.rollstream.com"  | "Owens & Minor"    |
  | "sammysoser@gmail.com"            | "No results found" |
  | "richdownie@gmail.com"            | "No results found" |
  | "rich@richdownie.com"             | "No results found" |
  

  