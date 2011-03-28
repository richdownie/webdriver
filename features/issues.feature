@set6
Feature: General Issue Scenarios

Background: Create Shipping Issue Type
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I setup the issue type

Scenario: A NON-CA Person can collaborate on issues assigned to their organization and can also modify issue line items (POST)
  And I am on the issues page
  And I add an issue with company "Owens & Minor" with color "Red"
  And I click the "Logout" link
  And I login with "rdownie+hparticipant@qamail1.rollstream.com"
  And I am on the issues page
  And I click the "Open(1)" link
  And I click the "1" link
  And I click the "Edit" link
  And I wait for "3" seconds
  And I fill in the text field "line_item_form_response_attributes_answers_attributes_0_value" with "Test"
  And I click the "Logout" link

Scenario: A NON-CA Person can create issues with organizations (CREATE, EDIT[OWN], POST)
  And I click the "Logout" link
  And I login with "rdownie+jcreator@qamail1.rollstream.com"
  And I am on the issues page
  And I add an issue with company "A&P" with color "Red"
  Then I should see the text "Issue created"
  And I click the "Logout" link

Scenario: A NON-CA Person can mediate issues assigned to their organization (VIEW, POST, EDIT, EXPORT, REOPEN)
  And I am on the issues home tab page
  And I wait for "3" seconds
  And I add an issue with company "Owens & Minor" with color "Red"
  And I wait for "3" seconds
  And I click the "Logout" link
  And I wait for "3" seconds
  And I login with "rdownie+jmediator@qamail1.rollstream.com"
  And I wait for "3" seconds
  And I am on the issues page
  And I wait for "3" seconds
  And I click the "Open(1)" link
  And I wait for "3" seconds
  And I click the "1" link
  And I wait for "3" seconds
  And I click the "Assign to hoyas" link
  And I wait for "3" seconds
  Then I should see the text "Pending (Waiting on hoyas)"
  And I wait for "3" seconds
  And I click the "Logout" link

Scenario: Add More Issues Link
  And I am on I am on the new issues page
  And I select "PING" from "issue_responder_id"
  And I fill in the text field "1" with "Red"
  And I fill in the text field "2" with "Blue"
  And I fill in the text field "3" with "Red"
  And I fill in the text field "4" with "Red"
  And I fill in the text field "5" with "Red"
  And I fill in the text field "6" with "Red"
  And I click the "add_more_rows" link
  And I fill in the text field "7" with "Red"
  And I fill in the text field "8" with "Red"
  And I fill in the text field "9" with "Red"
  And I fill in the text field "10" with "Red"
  And I fill in the text field "11" with "Red"
  And I click the "SAVE" button
  
  