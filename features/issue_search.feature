@firefox @lineitems
Feature: General Issue Search Scenarios

Background: 
Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I am on the Issues page
  And I setup the issue type
  And I add an issue with company "Owens & Minor" with color "Yellow"
  And I add an issue with company "PING" with color "Blue"
 
Scenario: Search by company id
  Given I am on the issues page
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
  Then I should see the text "Blue"
  Then I should see the text "Yellow"
  And I click the "Logout" link

Scenario: Search by company name
  Given I am on the issues page
  Then I make sure Search criteria is displayed
  And I click the "search_responder_company_name" checkbox
  And I fill in the text field "search_for_responder_company_name" with "Owens & Minor"
  And I click the "Search" button
  And I wait for "3" seconds
  Then I should NOT see the text "PING"
  Then I should see the text "Owens & Minor"
  Then I should see the text "Yellow"
  And I click the "Logout" link

Scenario: Search by creator email
  Given I am on the issues page
  Then I make sure Search criteria is displayed
  And I click the "search_issue_creator_email" checkbox
  And I fill in the text field "search_for_issue_creator_email" with "rdownie@qamail1.rollstream.com"
  And I click the "Search" button
  And I wait for "3" seconds
  Then I should see the text "Owens & Minor"
  Then I should see the text "PING"
  Then I should see the text "Blue"
  Then I should see the text "Yellow"
  And I click the "Logout" link

Scenario: Search for Line Item with start date == Today and no end date    
  Then I make sure Search criteria is displayed
  And I click the "search_create_date" checkbox
  And I fill in the text field "from_for_create_date" with "12/12/2020"
  And I click the "Search" button
  Then I should see the text "No results found"
  And I click the "Logout" link
  
