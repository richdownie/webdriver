@firefox @lineitems
Feature: Issue Type Security

Scenario: Setup
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I am on the Issues page
  And I click the "ADMIN" div
  And I click the "Create Issue Type" link
  And I fill in the text field "1" with "Pricing"
  And I fill in the text field "2" with "PR-44"
  And I fill in the text field "3" with "30"
  And I fill in the text field "4" with "7"
  And I fill in the text field "5" with "rdownie@rollstream.com"
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

Scenario Outline: On the Memberships page add multiple people
  And I visit Pricing Issue Type Memberships page
  And I fill in the text field "1" with <user>
  And I click the "Search" button
  And I select <role> from "issue_type_role"
  And I click the "1" checkbox
  And I click the "Add" button
  
  Examples:
  | user                                           |  role              |
  | "rdownie+hcreator@qamail1.rollstream.com"      | "Creator"          |
  | "rdownie+jcreator@qamail1.rollstream.com"      | "Creator"          |
  | "rdownie+hparticipant@qamail1.rollstream.com"  | "Participant"      |
  | "rdownie+jparticipant@qamail1.rollstream.com"  | "Participant"      |
  | "rdownie+hmediator@qamail1.rollstream.com"     | "Mediator"         |
  | "rdownie+jmediator@qamail1.rollstream.com"     | "Mediator"         |
  | "rdownie+hmanager@qamail1.rollstream.com"      | "Manager"          |
  | "rdownie+jmanager@qamail1.rollstream.com"      | "Manager"          |
  
Scenario Outline: Make Sure Each member can see new Issue Type
  Given I login with <user>
  And I am on the Issues page
  And I should see the text "Pricing"
  And I click the "Logout" link
  
  Examples:
  | user                                           |
  | "rdownie+hcreator@qamail1.rollstream.com"      |
  | "rdownie+jcreator@qamail1.rollstream.com"      |
  | "rdownie+hparticipant@qamail1.rollstream.com"  |
  | "rdownie+jparticipant@qamail1.rollstream.com"  |
  | "rdownie+hmediator@qamail1.rollstream.com"     |
  | "rdownie+jmediator@qamail1.rollstream.com"     |
  | "rdownie+hmanager@qamail1.rollstream.com"      |
  | "rdownie+jmanager@qamail1.rollstream.com"      |

  