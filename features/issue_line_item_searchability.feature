@set3
Feature: Testing CFG search by and column list capabilities

Background: Setup Shipping Issue Type
Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I am on the Issues page
  And I setup the issue type
  
Scenario: Toggle ISSUE CFG's
  And I click the "MANAGE ISSUES" link
  Then I should see the text "Form Question?"
  And I am on the issue types Admin page
  And I click the "Shipping Dispute" link
  And I click the "Issue Custom Fields" link
  And I click the "Edit" link
  And I wait for "3" seconds
  And I click the "question_viewable_in_list" checkbox
  And I click the "question_viewable_in_search" checkbox
  And I click the "SAVE" link
  And I click the "MANAGE ISSUES" link
  Then I should NOT see the exact text "Form Question?"
  And I click the "MANAGE LINE ITEMS" div
  Then I should NOT see the exact text "Form Question?"
  And I click the "Logout" link
  Given I login with "rdownie+hmanager@qamail1.rollstream.com"
  And I am on the Issues page
  And I click the "MANAGE ISSUES" div
  Then I should NOT see the exact text "Form Question?"
  And I click the "MANAGE LINE ITEMS" div
  Then I should NOT see the exact text "Form Question?"
  And I click the "Logout" link
  
Scenario: Toggle Line Items CFG's
  And I click the "MANAGE LINE ITEMS" link
  Then I should see the text "Line Item Question?"
  And I click the "ADMIN" div
  And I click the "Shipping Dispute" link
  And I click the "Line Item Custom Fields" link
  And I click the "Edit" link
  And I wait for "3" seconds
  And I click the "question_viewable_in_list" checkbox
  And I click the "question_viewable_in_search" checkbox
  And I click the "SAVE" link
  And I click the "MANAGE ISSUES" link
  Then I should NOT see the exact text "Form Question?"
  And I click the "MANAGE LINE ITEMS" div
  Then I should NOT see the exact text "Line Item Question?"
  And I click the "Logout" link
  Given I login with "rdownie+jmanager@qamail1.rollstream.com"
  And I am on the Issues page
  And I click the "MANAGE ISSUES" div
  Then I should NOT see the exact text "Line Item Question?"
  And I click the "MANAGE LINE ITEMS" div
  Then I should NOT see the exact text "Line Item Question?"
  And I click the "Logout" link
  