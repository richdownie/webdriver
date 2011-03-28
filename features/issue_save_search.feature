 @firefox @line_items
Feature: General Issue Search Scenarios that require data

Background: Create Shipping Issue Type
Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I setup the issue type

Scenario: Save Search for Line Items
  Given I am on the new issues page
  And I add an issue with company "PING" with color "Yellow"
  Given I am on the issues page
  And I click the "MANAGE LINE ITEMS" div
  And I click the "Save Search" link
  And The Line Item Save Search Name gets saved with "UPSTATE45"
  And I click the "Save" button
  And I wait for "3" seconds
  And I refresh the page
  And I wait for "3" seconds
  Then I click the "UPSTATE45" link
  Given I am on the issues page
  Then I should NOT see the text "UPSTATE45"
  And I click the "Logout" link
  Given I login with "rdownie+hmanager@qamail1.rollstream.com"
  Given I am on the issues page
  And I click the "MANAGE LINE ITEMS" div
  Then I should NOT see the text "UPSTATE45"
  And I click the "Logout" link
  
Scenario: Save Search for Issues
  Given I am on the new issues page
  And I add an issue with company "PING" with color "Yellow"
  Given I am on the issues page
  And I click the "Save Search" link
  And The Issues Save Search Name gets saved with "UPSTATE44"
  And I click the "Save" button
  And I wait for "3" seconds
  And I refresh the page
  And I wait for "3" seconds
  Then I click the "UPSTATE44" link
  And I click the "Logout" link
  Given I login with "rdownie+hmanager@qamail1.rollstream.com"
  Given I am on the issues page
  Then I should NOT see the text "UPSTATE44"
  And I click the "Logout" link