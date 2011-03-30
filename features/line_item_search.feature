@set2
Feature: General Line Item Search Scenarios

Background: 
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I am on the Issues page
  * I setup the issue type
  And I click the "ADD ISSUES" link
  And I select "Owens & Minor" from "issue_responder_id"
  And I fill in the text field "issue_form_response_attributes_answers_attributes_0_value" with "Red"
  And I fill in the text field "issue_line_items_attributes_0_form_response_attributes_answers_attributes_0_value" with "Black"
  And I click the "SAVE" button
  And I click the "ADD ISSUES" div
  And I select "PING" from "issue_responder_id"
  And I fill in the text field "issue_form_response_attributes_answers_attributes_0_value" with "Red"
  And I fill in the text field "issue_line_items_attributes_0_form_response_attributes_answers_attributes_0_value" with "Black"
  And I click the "SAVE" button
  
Scenario: Search by company id  
  Then I make sure Search criteria is displayed
  And I click the "search_responder_company_id" checkbox
  And I fill in the text field "search_for_responder_company_id" with "OM"
  And I click the "Search" button
  And I wait for "3" seconds
  Then I should NOT see the text "PING"
  Then I should see the text "Owens & Minor"
  Then I make sure Search criteria is displayed
  And I fill in the text field "search_for_responder_company_id" with "OM, ping44"
  And I click the "Search" button
  And I wait for "3" seconds
  Then I should see the text "Owens & Minor"
  Then I should see the text "PING"
  Then I should see the text "Red"
  Then I should see the text "Purple"
  And I click the "Logout" link

Scenario: Search by company name  
  Then I make sure Search criteria is displayed
  And I click the "search_responder_company_name" checkbox
  And I fill in the text field "search_for_responder_company_name" with "Owens & Minor"
  And I click the "Search" button
  And I wait for "3" seconds
  Then I should NOT see the text "PING"
  Then I should see the text "Owens & Minor"
  Then I should see the text "Black"
  Then I should see the text "Red"
  And I click the "Logout" link
  
Scenario: Search by creator email    
  Then I make sure Search criteria is displayed
  And I click the "search_issue_creator_email" checkbox
  And I fill in the text field "search_for_issue_creator_email" with "rdownie@qamail1.rollstream.com"
  And I click the "Search" button
  And I wait for "3" seconds
  And I wait for "3" seconds
  Then I should see the text "Owens & Minor"
  Then I should see the text "PING"
  Then I should see the text "Black"
  Then I should see the text "Yellow"
  Then I should see the text "Red"
  Then I should see the text "Purple"
  And I click the "Logout" link
  