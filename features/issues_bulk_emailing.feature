@firefox
Feature:  Implement cucumber stories for bulk emailing

Scenario: Setup Data
Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I am on the Issues page
  And I setup the issue type
  And I click the "Logout" link
  Given I login with "rdownie+hcreator@qamail1.rollstream.com"
  And I am on the new issues page
  And I wait for "2" seconds
  And I select "Owens & Minor" from "issue_responder_id"
  And I fill in the text field "1" with "Black"
  And I fill in the text field "2" with "Black"
  And I fill in the text field "4" with "Black"
  And I fill in the text field "6" with "Black"
  And I click the "SAVE" button
  And I am on the new issues page
  And I wait for "2" seconds
  And I select "PING" from "issue_responder_id"
  And I fill in the text field "1" with "Red"
  And I fill in the text field "2" with "Red"
  And I fill in the text field "4" with "Red"
  And I fill in the text field "6" with "Red"
  And I click the "SAVE" button
  And I am on the new issues page
  And I wait for "2" seconds
  And I select "Owens & Minor" from "issue_responder_id"
  And I fill in the text field "1" with "Green"
  And I fill in the text field "2" with "Green"
  And I fill in the text field "4" with "Green"
  And I fill in the text field "6" with "Green"
  And I click the "SAVE" button
  And I click the "Logout" link
  
Scenario: Re-send Email to PING Only
  Given I login with "rdownie+hmanager@qamail1.rollstream.com"
  And I am on the Issues page
  And I click the "MANAGE ISSUES" div
  Then I make sure Search criteria is displayed
  And I click the "search_responder_company_name" checkbox
  And I fill in the text field "search_for_responder_company_name" with "pInG"
  And I click the "Search" button
  And I click the "enableAllCheckbox" checkbox
  And I select "Resend Create Email" from "bulkOperations"
  And I click the "Update" link
  And I click the "Cancel" link
  And I click the "enableAllCheckbox" checkbox
  And I select "Resend Create Email" from "bulkOperations"
  And I click the "Update" link
  And I click the "Proceed With Update" button
  Then I should see the text "PING"
  Then I should see the text "resent"
  Then I click the "Logout" link
  
Scenario Outline: Resend Email with Creator, Mediators, Managers and CA
  Given I login with <user>
  And I am on the Issues page
  And I click the "MANAGE ISSUES" div
  And I select "Resend Create Email" from "bulkOperations"
  And I click the "Logout" link
  
  Examples:
  | user                                       |
  | "rdownie+hcreator@qamail1.rollstream.com"  |
  | "rdownie+hmediator@qamail1.rollstream.com" |
  | "rdownie+jmediator@qamail1.rollstream.com" |
  | "rdownie+jmanager@qamail1.rollstream.com"  |
  | "rdownie@qamail1.rollstream.com"           |
  