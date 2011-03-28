@set4 @wip
Feature: Company and Contact saved search scenarios

Background: Create Shipping Issue Type
  Given I login with "rdownie@qamail1.rollstream.com"
  And I remove existing search queries
  
Scenario Outline: Show Search
  And I am on <page>
  And I click the "Advanced" link
  And I wait for "3" seconds
  And I enter <query> in the advanced search textfield
  And I click the "Search" div
  And I click the "Save" div
  And I fill in the text field "search_name" with <query>
  And I click the "Save" button
  And I wait for "4" seconds
  And I am on <page>
  And I wait for "3" seconds
  And I click the "manage search" link
  And I click the "Show Search" link
  Then I should see the text "attributes match the following"
  And I click the "Logout" link
  
  Examples:
     | page                 | query         |
     | "the companies page" | "Ping"        |
     | "the contacts page"  | "Jack Abbott" |
  

Scenario Outline: Verify Results
  And I am on <page>
  And I click the "Advanced Search" link
  And I wait for "3" seconds
  And I enter <query> in the advanced search textfield
  And I click the "Search" div
  And I click the "Save" div
  And I fill in the text field "search_name" with <query>
  And I click the "Save" button
  And I wait for "4" seconds
  And I am on <page>
  And I wait for "3" seconds
  And I click the "search_query_fly_menu" link
  And I click the <query> link
  And I click the "Logout" link
  
  Examples:
     | page                 | query         |
     | "the companies page" | "Ping"        |
     | "the contacts page"  | "Jack Abbott" |

  
Scenario Outline: Add / Rename / Delete
  And I am on <page>
  And I fill in the text field "quick_search_field_id" with <name>
  And I wait for "2" seconds
  And I click the "Advanced Search" link
  And I wait for "2" seconds
  And I click the "save_search" div
  And I wait for "2" seconds
  And I fill in the text field "search_name" with <name>
  And I wait for "2" seconds
  And I click the "Save" button
  And I wait for "2" seconds
  And I am on <page>
  And I wait for "2" seconds
  And I click the "search_query_fly_menu" link
  And I click the <name> link                        #Add Verified
  And I click the "manage search" link
  And I wait for "2" seconds
  And I click the "1" checkbox
  And I wait for "2" seconds
  And I click the "Rename" link
  And I wait for "2" seconds
  And I fill in the text field "search_name" with <updated_name>
  And I wait for "2" seconds
  And I click the "Rename" button
  And I wait for "2" seconds
  And I am on <page>
  And I wait for "4" seconds
  And I click the "search_query_fly_menu" link
  And I click the <updated_name> link               #Rename Verified
  And I click the "manage search" link
  And I wait for "2" seconds
  And I click the "1" checkbox
  And I click the "Remove" link
  And I wait for "2" seconds
  And I click the "Delete selected" button
  And I wait for "7" seconds
  Then I should NOT see the text <updated_name>
  And I am on <page>
  And I wait for "7" seconds
  Then I should NOT see the text <updated_name>
  #Delete Verified
  And I click the "Logout" link
  
  Examples:
     | page                 | name     | updated_name    |
     | "the companies page" | "Ping"   | "PingRenamed"   |
     | "the contacts page"  | "downie" | "downieRenamed" |