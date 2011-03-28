Feature: Search/Update and Unauthorized scenarios

Background:
Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I am on the Issues page
  And I setup the issue type
  And I click the "ADD ISSUES" link
  And I select "Owens & Minor" from "issue_responder_id"
  And I fill in the text field "1" with "Purple"
  And I fill in the text field "2" with "Orange"
  And I fill in the text field "4" with "Green"
  And I click the "SAVE" button
  And I wait for "5" seconds
  And I click the "ADD ISSUES" div
  And I wait for "5" seconds
  And I select "PING" from "issue_responder_id"
  And I fill in the text field "1" with "Black"
  And I fill in the text field "2" with "Red"
  And I fill in the text field "4" with "Blue"
  And I click the "SAVE" button
 
@firefox @lineitems
Scenario: Searching and Bulk updating by Selected rows  
  Then I make sure Search criteria is displayed
  And I click the "search_responder_company_id" checkbox
  And I fill in the text field "search_for_responder_company_id" with "OM"
  And I click the "Search" button
  And I wait for "3" seconds
  And I select "Mark Pending" from "bulkOperations"
  And I set checkbox "2" in the search results
  And I click the "Update" link
  And I click the "Proceed With Update" button
  And I click the "Click here" link
  And I click the "MANAGE ISSUES" div
  Then I should see the text "Pending(1)"
  Then I should see the text "Open(1)"
  And I click the "Logout" link

@set3
Scenario: Searching and Bulk updating by Selected rows after clicking "Check All" checkbox   
  Then I make sure Search criteria is displayed 
  And I click the "search_responder_company_id" checkbox
  And I fill in the text field "search_for_responder_company_id" with "OM"
  And I click the "Search" button
  And I wait for "3" seconds
  And I select "Mark Pending" from "bulkOperations"
  And I set checkbox "1" in the search results
  And I click the "Update" link
  And I click the "Proceed With Update" button
  And I click the "Click here" link
  And I click the "MANAGE ISSUES" div
  Then I should see the text "Pending(2)"
  Then I should see the text "Open(0)"
  And I click the "Logout" link

@set4
Scenario: Verify unauthorized message in Bulk Update
  Given I login with "rdownie+jparticipant@qamail1.rollstream.com"
  And I am on the issues page
  And I click the "MANAGE LINE ITEMS" div
  And I select "Mark Pending" from "bulkOperations"
  And I set checkbox "1" in the search results
  And I click the "Update" link
  And I click the "Proceed With Update" button
  And I am on the issues page
  And I click the "MANAGE LINE ITEMS" div
  And I select "Mark Pending" from "bulkOperations"
  And I set checkbox "2" in the search results
  And I click the "Update" link
  And I click the "Proceed With Update" button
  And I wait for "3" seconds
  Then I should see the text "1 error occurred while attempting to update 1 line item"
  And I click the "Click here" link
  And I click the "MANAGE ISSUES" div
  Then I should see the text "Pending(2)"
  Then I should see the text "Open(0)"
  And I click the "Logout" link