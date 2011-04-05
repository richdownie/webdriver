@firefox
Feature: Reordering custom fields

Background:
  * I login with "rdownie@qamail1.rollstream.com"
  * I reset the Items data
  * I reset the Issues data
  
Scenario: Items
  * I am on the item custom fields page
  * I wait for "10" seconds
  * I click the "Manage Custom Fields" link
  * I wait for "10" seconds
  * I click the "Text" link
  * I wait for "10" seconds
  * I fill in the text field "question_label" with "Text CF"
  * I wait for "10" seconds
  * I click the "SAVE" link
  * I wait for "10" seconds
  * I click the "Manage Custom Fields" link
  * I wait for "10" seconds
  * I click the "Number" link
  * I wait for "10" seconds
  * I fill in the text field "question_label" with "Number CF"
  * I wait for "10" seconds
  * I click the "SAVE" link
  * I wait for "10" seconds
  * I click row "0" in the "results clear" table
  * I wait for "10" seconds
  * I select "2" from "posn_1"
  * I wait for "10" seconds
  * I click the "Move this custom field" button
  
Scenario: Issues
  * I setup the issue type
  * I click the "Shipping Dispute" link
  * I click the "Issue Custom Fields" link
  * I click the "Manage Custom Fields" link
  * I click the "Number" link
  * I fill in the text field "question_label" with "Number CF"
  * I click the "SAVE" link
  * I click row "0" in the "results clear" table
  * I select "2" from "posn_1"
  * I click the "Move this custom field" button

Scenario: LineItems  
  * I setup the issue type
  * I click the "Shipping Dispute" link
  * I click the "Line Item Custom Fields" link
  * I click the "Manage Custom Fields" link
  * I click the "Number" link
  * I fill in the text field "question_label" with "Number CF"
  * I click the "SAVE" link
  * I click row "0" in the "results clear" table
  * I select "2" from "posn_1"
  * I click the "Move this custom field" button
  
