@set2
Feature: General Issue Delete Scenarios

Background: Setup
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I setup the issue type
  And I add an issue with company "Owens & Minor" with color "Green"
  And I click the "Logout" link

Scenario Outline: Individual Issue Delete from the show page
  Given I login with <user>
  And I am on the issues page
  And I click cell "2" row "2" in the "result-list issues scrollable" table
  Then I click the "Delete" link
  And I click the "DELETE" link
  And I click the "Proceed With Update" button
  And I click the "Click here" link
  And I wait for "5" seconds
  Then I should see the text "No results found"
  And I click the "Logout" link
  
  Examples:
  | user                                       |
  | "rdownie@qamail1.rollstream.com"           |
  | "rdownie+hmanager@qamail1.rollstream.com"  |
