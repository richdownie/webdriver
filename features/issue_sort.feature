@firefox @lineitems
Feature: General Issue Sort Scenarios

Scenario: Setting up for below scenarios:
Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I setup the issue type
  And I click the "ADD ISSUES" link
  And I select "Owens & Minor" from "issue_responder_id"
  And I fill in the text field "1" with "Purple"
  And I fill in the text field "2" with "Orange"
  And I fill in the text field "4" with "Green"
  And I click the "SAVE" button
  
Scenario Outline: Sort Columns on MANAGE LINE ITEMS
  Given I am on the issues page
  And I click the "MANAGE LINE ITEMS" div
  And I click the <link> link
  
  Examples:
    | link                |
    | "Issue ID"          |
    | "Line #"            |
    | "Organization"      |
    | "Company"           |
    | "Status"            |
    | "Date Created"      |
    | "Due Date"          |
    | "Form Question?"       |
    | "Line Item Question?"  |
  

Scenario Outline: Sort Columns on MANAGE ISSUES
  Given I am on the issues page
  And I click the "MANAGE ISSUES" div
  And I click the <link> link

    Examples:
      | link                |
      | "Issue ID"          |
      | "Organization"      |
      | "Company"           |
      | "Status"            |
      | "Date Created"      |
      | "Form Question?"       |

Scenario Outline: Search and Sort Columns on MANAGE LINE ITEMS
  And I am on the issues page
  And I click the "MANAGE LINE ITEMS" div
  Then I make sure Search criteria is displayed
  And I click the "search_initiator_company_id" checkbox
  And I fill in the text field "search_for_initiator_company_id" with "AUTO44"
  And I click the "Search" button
  And I click the <link> link

    Examples:
      | link                |
      | "Issue ID"          |
      | "Line #"       |
      | "Organization"      |
      | "Company"           |
      | "Status"            |
      | "Date Created"      |
      | "Due Date"          |
      | "Form Question?"       |
      | "Line Item Question?"  |
  
  
