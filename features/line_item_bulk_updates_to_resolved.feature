@set4
Feature: General Issue Bulk Change Scenarios

Background:
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I wait for "3" seconds
  And I am on the Issues page
  And I wait for "3" seconds
  And I setup the issue type
  And I am on the new issues page
  And I select "Owens & Minor" from "issue_responder_id"
  And I fill in the text field "issue_form_response_attributes_answers_attributes_0_value" with "Purple"
  And I fill in the text field "issue_line_items_attributes_0_form_response_attributes_answers_attributes_0_value" with "Orange"
  And I fill in the text field "issue_line_items_attributes_1_form_response_attributes_answers_attributes_0_value" with "Green"
  And I click the "SAVE" button
  And I wait for "4" seconds
  And I am on the new issues page
  And I select "PING" from "issue_responder_id"
  And I fill in the text field "issue_form_response_attributes_answers_attributes_0_value" with "Black"
  And I fill in the text field "issue_line_items_attributes_0_form_response_attributes_answers_attributes_0_value" with "Red"
  And I fill in the text field "issue_line_items_attributes_1_form_response_attributes_answers_attributes_0_value" with "Blue"
  And I click the "SAVE" button
  And I wait for "4" seconds
  And I select "Mark Pending" from "bulkOperations"
  And I set the first checkbox in the search results
  And I click the "Update" link
  And I click the "Proceed With Update" button
  And I click the "Click here" link
  And I click the "Logout" link

Scenario: Update to Pending "All Search" results as Community Administrator
  And I wait for "4" seconds
  Given I login with "rdownie@qamail1.rollstream.com"
  Given I am on the issues page
  And I wait for "4" seconds
  And I click the "MANAGE LINE ITEMS" div
  And I select "Mark Resolved" from "bulkOperations"
  And I set the first checkbox in the search results
  And I click the "Update" link
  And I click the "Proceed With Update" button
  And I click the "Click here" link
  And I click the "MANAGE ISSUES" div
  Then I should see the text "Pending(0)"
  Then I should see the text "Open(0)"
  Then I should see the text "Resolved(2)"
  And I click the "Logout" link
  
Scenario: Update to Pending "All Search" results as Organization (Hub) Manager  
  And I wait for "4" seconds
  Given I login with "rdownie+hmanager@qamail1.rollstream.com"
  Given I am on the issues page
  And I wait for "4" seconds
  And I click the "MANAGE LINE ITEMS" div
  And I select "Mark Resolved" from "bulkOperations"
  And I set the first checkbox in the search results
  And I click the "Update" link
  And I click the "Proceed With Update" button
  And I wait for "4" seconds
  And I click the "Click here" link
  And I click the "MANAGE ISSUES" div
  Then I should see the text "Pending(0)"
  Then I should see the text "Open(0)"
  Then I should see the text "Resolved(2)"
  And I click the "Logout" link
  
Scenario: Update to Pending "All Search" results as Company (Spoke) Manager **Responders can no longer Resolve
  Given I login with "rdownie+jmanager@qamail1.rollstream.com"
  Given I am on the issues page
  And I click the "MANAGE LINE ITEMS" div
  And I select "Mark Resolved" from "bulkOperations"
  And I set the first checkbox in the search results
  And I click the "Update" link
  And I click the "Proceed With Update" button
  Then I should see the text "You are not authorized to change the status of this line item from Pending to Resolved"
  And I click the "Logout" link
  
Scenario: Update to Pending "All Search" results as Organization (Hub) Mediator
  Given I login with "rdownie+hmediator@qamail1.rollstream.com"
  Given I am on the issues page
  And I click the "MANAGE LINE ITEMS" div
  And I select "Mark Resolved" from "bulkOperations"
  And I set the first checkbox in the search results
  And I click the "Update" link
  And I click the "Proceed With Update" button
  And I click the "Click here" link
  And I click the "MANAGE ISSUES" div
  Then I should see the text "Pending(0)"
  Then I should see the text "Open(0)"
  Then I should see the text "Resolved(2)"
  And I click the "Logout" link
  
Scenario: Update to Pending "All Search" results as Company (Spoke) Mediator **Responders can no longer Resolve
  Given I login with "rdownie+jmediator@qamail1.rollstream.com"
  Given I am on the issues page
  And I click the "MANAGE LINE ITEMS" div
  And I select "Mark Resolved" from "bulkOperations"
  And I set the first checkbox in the search results
  And I click the "Update" link
  And I click the "Proceed With Update" button
  Then I should see the text "You are not authorized to change the status of this line item from Pending to Resolved"
  And I click the "Logout" link
  
Scenario: Update to Pending "All Search" results as Organization (Hub) Participant
  Given I login with "rdownie+hparticipant@qamail1.rollstream.com"
  Given I am on the issues page
  And I click the "MANAGE LINE ITEMS" div
  Then I should NOT see the text "Mark Resolved"
  And I click the "Logout" link
  
Scenario: Update to Pending "All Search" results as Company (Spoke) Participant
  Given I login with "rdownie+jparticipant@qamail1.rollstream.com"
  Given I am on the issues page
  And I click the "MANAGE LINE ITEMS" div
  Then I should NOT see the text "Mark Resolved"
  And I click the "Logout" link
  
Scenario: Update to Pending "All Search" results as Organization (Hub) Creator
  Given I login with "rdownie+hcreator@qamail1.rollstream.com"
  Given I am on the issues page
  And I click the "MANAGE LINE ITEMS" div
  Then I should NOT see the text "Mark Resolved"
  And I click the "Logout" link
  
Scenario: Update to Pending "All Search" results as Company (Spoke) Creator
  Given I login with "rdownie+jcreator@qamail1.rollstream.com"
  Given I am on the issues page
  And I click the "MANAGE LINE ITEMS" div
  Then I should NOT see the text "Mark Resolved"
  And I click the "Logout" link
