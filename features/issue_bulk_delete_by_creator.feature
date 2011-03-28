@set3
Feature: Bulk Issue Deletes

Background: Setup
Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  Given I setup the issue type
  And I click the "Logout" link
  
Scenario Outline: Individual Issue Delete from the show page
  Given I login with <user>
  And I am on the Issues page
  And I add an issue with company "PING" with color "Yellow"
  And I am on the Issues page
  And I click the "MANAGE ISSUES" div
  And I click the "enableAllCheckbox" checkbox
  And I select "Delete" from "bulkOperations"
  And I click the "Update" link
  And I click the "Proceed With Update" button
  And I click the "Click here" link
  And I click the "Logout" link
  
  Examples:
  | user                                       |
  | "rdownie+hcreator@qamail1.rollstream.com"  |
  | "rdownie+jcreator@qamail1.rollstream.com"  |
  
Scenario: Bulk Issue Delete from ISSUE page
  Given I login with "rdownie+hcreator@qamail1.rollstream.com"
  And I am on the Issues page
  And I add an issue with company "Owens & Minor" with color "Blue"
  And I wait for "4" seconds
  And I am on the issues page
  And I wait for "4" seconds
  And I select "Delete" from "bulkOperations"
  And I click the "enableAllCheckbox" checkbox
  And I click the "Update" link
  And I wait for "4" seconds
  And I click the "Proceed With Update" button
  And I wait for "4" seconds
  And I click the "Click here" link
  And I wait for "4" seconds
  Then I should see the text "No results found"
  
Scenario: Company Specific Bulk Issue Delete, by Company Manager from ISSUE page 
  Given I login with "rdownie+hcreator@qamail1.rollstream.com"
  And I am on the Issues page
  And I add an issue with company "Owens & Minor" with color "Blue"
  And I add an issue with company "PING" with color "Yellow"
  And I wait for "5" seconds
  And I click the "Logout" link
  
  Given I login with "rdownie+jmanager@qamail1.rollstream.com"
  And I am on the Issues page
  And I click the "MANAGE ISSUES" div
  And I select "Delete" from "bulkOperations"
  And I click the "enableAllCheckbox" checkbox
  And I click the "Update" link
  And I click the "Proceed With Update" button
  Then I should see the text "You are not authorized to delete this issue."
  And I click the "Logout" link
  
  Given I login with "rdownie+hmediator@qamail1.rollstream.com"
  And I am on the Issues page
  Then I should see the text "PING"
  Then I should NOT see the exact text "Owens & Minor (OM)"
  And I click the "Logout" link

