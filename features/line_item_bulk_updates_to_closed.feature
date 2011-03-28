@set5
Feature: Bulk Updates to MANAGE LINE ITEMS TAB

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
  And I click the "ADD ISSUES" div
  And I select "PING" from "issue_responder_id"
  And I fill in the text field "1" with "Black"
  And I fill in the text field "2" with "Red"
  And I fill in the text field "4" with "Blue"
  And I click the "SAVE" button
  And I select "Mark Pending" from "bulkOperations"
  And I click the "2" radio button
  And I click the "Update" link
  And I click the "Proceed With Update" button
  And I click the "Click here" link
  And I select "Mark Resolved" from "bulkOperations"
  And I click the "2" radio button
  And I click the "Update" link
  And I click the "Proceed With Update" button
  And I click the "Click here" link

Scenario: Update to Closed "All Search" results as Community Administrator
  And I select "Mark Closed" from "bulkOperations"
  And I click the "2" radio button
  And I click the "Update" link
  And I click the "Proceed With Update" button
  And I click the "Click here" link
  And I click the "MANAGE ISSUES" div
  Then I should see the text "Pending(0)"
  Then I should see the text "Open(0)"
  Then I should see the text "Resolved(0)"
  Then I should see the text "Closed(2)"
  And I click the "Logout" link
  
Scenario: Update to Closed "All Search" results as Organization (Hub) Manager
  And I click the "Logout" link
  Given I login with "rdownie+hmanager@qamail1.rollstream.com"
  Given I am on the issues page
  And I click the "MANAGE LINE ITEMS" div
  And I select "Mark Closed" from "bulkOperations"
  And I click the "2" radio button
  And I click the "Update" link
  And I click the "Proceed With Update" button
  And I click the "Click here" link
  And I click the "MANAGE ISSUES" div
  Then I should see the text "Pending(0)"
  Then I should see the text "Open(0)"
  Then I should see the text "Resolved(0)"
  Then I should see the text "Closed(2)"
  And I click the "Logout" link
  
Scenario: Update to Closed "All Search" results as Company (Spoke) Manager
  And I click the "Logout" link
  Given I login with "rdownie+jmanager@qamail1.rollstream.com"
  Given I am on the issues page
  And I click the "MANAGE LINE ITEMS" div
  And I select "Mark Closed" from "bulkOperations"
  And I click the "2" radio button
  And I click the "Update" link
  And I click the "Proceed With Update" button
  And I click the "Click here" link
  And I click the "MANAGE ISSUES" div
  Then I should see the text "Pending(0)"
  Then I should see the text "Open(0)"
  Then I should see the text "Resolved(2)"
  Then I should see the text "Closed(0)"
  And I click the "Logout" link
  
Scenario: Update to Closed "All Search" results as Organization (Hub) Mediator
  And I click the "Logout" link
  Given I login with "rdownie+hmediator@qamail1.rollstream.com"
  Given I am on the issues page
  And I click the "MANAGE LINE ITEMS" div
  Then I should NOT see the text "Mark Closed"
  And I click the "Logout" link
  
Scenario: Update to Closed "All Search" results as Company (Spoke) Mediator
  And I click the "Logout" link
  Given I login with "rdownie+jmediator@qamail1.rollstream.com"
  Given I am on the issues page
  And I click the "MANAGE LINE ITEMS" div
  Then I should NOT see the text "Mark Closed"
  And I click the "Logout" link
  
Scenario: Update to Closed "All Search" results as Organization (Hub) Participant
  And I click the "Logout" link
  Given I login with "rdownie+hparticipant@qamail1.rollstream.com"
  Given I am on the issues page
  And I click the "MANAGE LINE ITEMS" div
  Then I should NOT see the text "Mark Closed"
  And I click the "Logout" link
  
Scenario: Update to Closed "All Search" results as Company (Spoke) Participant
  And I click the "Logout" link
  Given I login with "rdownie+jparticipant@qamail1.rollstream.com"
  Given I am on the issues page
  And I click the "MANAGE LINE ITEMS" div
  Then I should NOT see the text "Mark Closed"
  And I click the "Logout" link
  
Scenario: Update to Closed "All Search" results as Organization (Hub) Creator
  And I click the "Logout" link
  Given I login with "rdownie+hcreator@qamail1.rollstream.com"
  Given I am on the issues page
  And I click the "MANAGE LINE ITEMS" div
  Then I should NOT see the text "Mark Closed"
  And I click the "Logout" link
  
Scenario: Update to Closed "All Search" results as Company (Spoke) Creator
  And I click the "Logout" link
  Given I login with "rdownie+jcreator@qamail1.rollstream.com"
  Given I am on the issues page
  And I click the "MANAGE LINE ITEMS" div
  Then I should NOT see the text "Mark Closed"
  And I click the "Logout" link
