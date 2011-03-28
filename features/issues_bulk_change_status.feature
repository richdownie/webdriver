@firefox @lineitems
Feature: Bulk Change Status of issues 

Scenario: Setup
Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I am on the Issues page
  And I setup the issue type
  And I click the "ADD ISSUES" link
  And I select "Owens & Minor" from "issue_responder_id"
  And I fill in the text field "1" with "Black"
  And I fill in the text field "2" with "Black"
  And I fill in the text field "4" with "Black"
  And I fill in the text field "6" with "Black"
  And I click the "SAVE" button
  And I click the "ADD ISSUES" div
  And I select "Owens & Minor" from "issue_responder_id"
  And I fill in the text field "1" with "Red"
  And I fill in the text field "2" with "Red"
  And I fill in the text field "4" with "Red"
  And I fill in the text field "6" with "Red"
  And I click the "SAVE" button
  And I click the "ADD ISSUES" div
  And I select "Owens & Minor" from "issue_responder_id"
  And I fill in the text field "1" with "Green"
  And I fill in the text field "2" with "Green"
  And I fill in the text field "4" with "Green"
  And I fill in the text field "6" with "Green"
  And I click the "SAVE" button
  And I click the "Logout" link
  
Scenario: try a subset arrived at via search
  Given I login with "rdownie@qamail1.rollstream.com"
  And I am on the Issues page
  And I click the "MANAGE LINE ITEMS" div
  Then I make sure Search criteria is displayed
  And I click the "1" checkbox
  And I fill in the text field "11" with "Black"
  And I select "Mark Pending" from "bulkOperations"
  And I click the "enableAllCheckbox" checkbox
  And I click the "Update" link
  And I click the "Proceed With Update" button
  And I click the "Click here" link
  Then I should see the text "Pending"
  And I click the "Reset" link
  And I click the "Logout" link
  
Scenario: try changing from one status to the same status (shouldn't be an option to do this) 
  Given I login with "rdownie@qamail1.rollstream.com"   
  And I am on the Issues page
  And I click the "MANAGE LINE ITEMS" div
  Then I make sure Search criteria is displayed
  And I click the "1" checkbox
  And I fill in the text field "11" with "Black"
  And I click the "Search" button
  And I select "Mark Pending" from "bulkOperations"
  And I click the "enableAllCheckbox" checkbox
  And I click the "Update" link
  And I click the "Proceed With Update" button
  Then I should see the text "not authorized"
  And I click the "Click here" link
  Then I should see the text "Pending"
  And I click the "Reset" link
  And I click the "Search" button
  And I click the "Logout" link

Scenario: try changing from all different other stati to a new status
  Given I login with "rdownie@qamail1.rollstream.com"
  And I am on the Issues page
  And I click the "MANAGE LINE ITEMS" div
  And I select "Mark Resolved" from "bulkOperations"
  And I click the "enableAllCheckbox" checkbox
  And I click the "Update" link
  And I click the "Proceed With Update" button
  And I click the "Click here" link
  Then I should see the text "Resolved"
  And I click the "Reset" link
  And I click the "Search" button
  And I click the "Logout" link