@set3
Feature: Issue Management Null Email Templates

Scenario Outline: Valid Access
  Given I login with <user>
  And I am on the issue types Admin page
  And I click the "Shipping Dispute" link
  And I click the "Basic Settings" link
  And I click the <link> link
  Then I click the "SAVE" button

  Examples: 
  | user                             | link                               |
  | "rdownie@qamail1.rollstream.com" | "New Line Item Added"      |     
  | "rdownie@qamail1.rollstream.com" | "Line Item Set to Open"    |
  | "rdownie@qamail1.rollstream.com" | "Line Item Set to Pending" |
  | "rdownie@qamail1.rollstream.com" | "Resolved Line Item" |
  
Scenario Outline: Email Attachments and Custom Fields
  Given I login with <user>
  And I am on the issue types Admin page
  And I click the "Shipping Dispute" link
  And I click the "Basic Settings" link
  And I click the <link> link
  And I click the "Attachments" link
  And I upload "Companies.csv" to the "file" file field
  And I wait for "5" seconds
  And I click the "Logout" link

  Examples: 
  | user                             | link                               |
  | "rdownie@qamail1.rollstream.com" | "New Line Item Added"      |     
  | "rdownie@qamail1.rollstream.com" | "Line Item Set to Open"    |
  | "rdownie@qamail1.rollstream.com" | "Line Item Set to Pending" |
  | "rdownie@qamail1.rollstream.com" | "Resolved Line Item" |
  
Scenario Outline: Upload diff types of files to email templates
  Given I login with <user>
  And I am on the issue types Admin page
  And I click the "Shipping Dispute" link
  And I click the "Basic Settings" link
  And I click the <link> link
  And I click the "Custom Fields" link
  And I wait for "3" seconds
  And I click the <custom_field1> link
  And I click the "Logout" link

  Examples: 
  | user                             | link                               | custom_field1    |
  | "rdownie@qamail1.rollstream.com" | "New Line Item Added"      | "Community Name" |
  | "rdownie@qamail1.rollstream.com" | "Line Item Set to Open"    | "Community Name" | 
  | "rdownie@qamail1.rollstream.com" | "Line Item Set to Pending" | "Community Name" | 
  | "rdownie@qamail1.rollstream.com" | "Resolved Line Item" | "Community Name" |
  
  
####################  Testing/Fail #####################
  
# @manual  
# Scenario: Insert all the diff Custom Fields
# 
# ####################  Completed/Pass #####################  
# @manual  
# Scenario: Upload diff types of files to email templates
# @manual
# Sceanrio: FCKEditor tested each icon spell check doesnt seem to work
# @manual
# Sceanrio: Insert Files for download in 4 email templates

  