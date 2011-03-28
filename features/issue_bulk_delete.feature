@set4
Feature: Bulk Issue Deletes

Background: Setup
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I setup the issue type
  And I add an issue with company "Owens & Minor" with color "Yellow"
  And I add an issue with company "PING" with color "Blue"
  And I wait for "4" seconds
  And I click the "Logout" link  

  Scenario Outline: Individual Issue Delete from the show page
  Given I login with <user>
  And I am on the issues page
  And I click the "MANAGE ISSUES" div
  And I click the "enableAllCheckbox" checkbox
  And I select "Delete" from "bulkOperations"
  And I click the "Update" link
  And I click the "Proceed With Update" button
  And I click the "Click here" link
  And I wait for "3" seconds
  And I click the "Logout" link
  
  Examples:
  | user                                       |
  | "rdownie@qamail1.rollstream.com"           |
  | "rdownie+hmediator@qamail1.rollstream.com" |
  | "rdownie+hmanager@qamail1.rollstream.com"  |
  | "rdownie+jmediator@qamail1.rollstream.com" |
  | "rdownie+jmanager@qamail1.rollstream.com"  |

