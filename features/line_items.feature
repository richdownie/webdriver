@set3
Feature: Line_Item flow Scenarios

Background: Create Shipping Issue Type
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I setup the issue type
  
Scenario:  Navigate through line items widget
  And I am on the new issues page
  And I select "Owens & Minor" from "issue_responder_id"
  And I fill in the text field "issue_form_response_attributes_answers_attributes_0_value" with "Navigate"
  And I fill in the text field "issue_line_items_attributes_0_form_response_attributes_answers_attributes_0_value" with "One"
  And I fill in the text field "issue_line_items_attributes_1_form_response_attributes_answers_attributes_0_value" with "Two"
  And I fill in the text field "issue_line_items_attributes_2_form_response_attributes_answers_attributes_0_value" with "Three"
  And I fill in the text field "issue_line_items_attributes_3_form_response_attributes_answers_attributes_0_value" with "Four"
  And I click the "issue_submit" button
  And I click the "1" link
  And I click the "MANAGE LINE ITEMS" link
  And I click the "1" link