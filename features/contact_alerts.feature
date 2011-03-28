@set5
Feature: Contact Alert Scenarios

Scenario: Crud a Contact Alert 
  #Create
	Given I login with "rdownie@qamail1.rollstream.com"
  And I am on the contacts page
	Then I check for the header and footer
	And I click the "ALERTS" div
	And I click the "new_ui_blue_button_inner" div
	And I wait for "4" seconds
	And I fill in the text field "alert_query_name" with random "Alert"
	And I select "Contact" from "alert_query_col1"
	And I select "Email Address" from "alert_query_col2"
	And I select "First Name" from "alert_query_col2"
	And I select "Last Name" from "alert_query_col2"
	And I select "Salutation" from "alert_query_col2"
	And I select "Phone" from "alert_query_col2"
	And I select "Fax" from "alert_query_col2"
  And I select "City" from "alert_query_col2"
  And I select "State / Province / Region" from "alert_query_col2" 
  And I select "Postal Code" from "alert_query_col2"
  And I select "Country" from "alert_query_col2"
  And I select "Notes" from "alert_query_col2"
  And I select "Disabled" from "alert_query_col2"
  And I select "Contact Role" from "alert_query_col2"
  And I select "Changes" from "alert_query_col3"
  And I click the "More conditions" link
  Then I should see the text "attributes match the following:"
  And I click the "1" checkbox
  And I click the "2" checkbox
  And I click the "new_ui_blue_button_inner" div
	And I wait for "2" seconds
  #Edit  
  And I am on the contacts page
  And I click the "ALERTS" div
  And I click the "None" link
  And I click the "Edit" link
  And I fill in the text field "alert_query_name" with random "Alert Updated"
  And I click the "new_ui_blue_button_inner" div
  #Delete  
  And I am on the contacts page
  And I click the "ALERTS" div
  And I click the "All" link
	And I click the "Remove selected" link
	And I click the "Delete" button
  And I click the "Logout" link