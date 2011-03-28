@firefox @lineitems
Feature: Searching Sent and Unsent Emails

Background: Setup
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I am on the Issues page
  And I setup the issue type


Scenario: Create Issue as Hub Creator and Verify search Sent and Unsent
  Given I login with "rdownie+hcreator@qamail1.rollstream.com"
  And I am on the Issues page
  And I add an issue with company "Owens & Minor" with color "Purple"
  And I click the "search_create_notification_sent" checkbox
  And I select "Sent" from "search_for_create_notification_sent"
  And I click the "Search" button
  Then I should see the text "No results found"
  Given I set the issue "create_notification_sent" to true
  And I am on the Issues page
  And I click the "search_create_notification_sent" checkbox
  And I select "Sent" from "search_for_create_notification_sent"
  And I click the "Search" button
  Then I should see the text "Owens & Minor (OM)"
  And I click the "Logout" link
  