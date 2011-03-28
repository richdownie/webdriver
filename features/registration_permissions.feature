Feature: Registration Permissions

  Background: Submit a new Registration Requests
    Given I login with "rdownie+sc@qamail1.rollstream.com"
	And I remove all existing Onboard Requests
	And I click the "Logout" link
	And I am on the change request page
	And I click the "Continue" button
	And I fill in the text field "onboarding_company_name" with random "Requested Company"
	#And I fill in the text field "onboarding_company_email" with random "rdownie+requestedcompany@qamail1.rollstream.com"
	And I fill in the text field "onboarding_company_phone" with random "555-555-5555"
	And I fill in the text field "onboarding_company_address_line1" with "1 Future Ave"
	And I fill in the text field "onboarding_company_address_city" with "Rochester"
	And I fill in the text field "onboarding_company_address_state" with "NEW YORK"
	And I fill in the text field "onboarding_company_address_zip" with "14625"
	And I fill in the text field "onboarding_company_address_country" with "USA"
	And I click the "Primary Contact" link
	And I fill in the text field "onboarding_contact_first_name" with "Mike"
	And I fill in the text field "onboarding_contact_last_name" with "Requested_Contact"
	And I fill in the text field "onboarding_contact_email" with "rdownie+requestedcontact@qamail1.rollstream.com"
	And I fill in the text field "onboarding_contact_work_phone" with "555-555-5555"
	And I click the "Submit Request" div
	And I wait for "3" seconds
	And I fill in the text field "request_first_name" with "Spoke"
	And I fill in the text field "request_last_name" with "Contact"
	And I fill in the text field "request_email" with "rdownie+sc@qamail1.rollstream.com"
	And I fill in the text field "request_phone" with "555-555-5555"
	And I fill in the text field "request_company_name" with "Ping"
	And I submit the anonymous registration
	And I wait for "10" seconds
	And I close the anonymous user session

@wip	
  Scenario: Click through the Pre-Approver and Approver Process  
    Given I login with "rdownie+pa@qamail1.rollstream.com"
    And I am on the onboarding requests page
    Then I should see the text "Pre-Approval"
    And I click row "2" in the "onboarding_list" table
    And I click the "Approve Request" div
    And I preapprove the request
	And I wait for "3" seconds
    And I switch onboarding role to Approver
    And I click the "Logout" link
	Given I login with "rdownie+sc@qamail1.rollstream.com"
    And I am on the onboarding requests page
    And I click the "All" link
    And I wait for "2" seconds
    Then I should see the text "Approver"
    And I click row "2" in the "onboarding_list" table
	
  Scenario: I Decline a Request as a Project Administrator  
	Given I login with "rdownie+pa@qamail1.rollstream.com"
    And I am on the onboarding requests page
    Then I should see the text "Pre-Approval"
    And I click row "2" in the "onboarding_list" table
    And I click the "Decline Request" div
	And I wait for "3" seconds
	And I fill in the text field "decline_reason" with "Testing Decline Process"
    And I submit the anonymous registration

  Scenario: Save changes to a Registration Request	  
	Given I login with "rdownie+pa@qamail1.rollstream.com"
    And I am on the onboarding requests page
    Then I should see the text "Pre-Approval"
    And I click row "2" in the "onboarding_list" table
    And I click the "Company" link
    And I fill in the text field "onboarding_company_address_state" with "VIRGINIA"
    And I fill in the text field "onboarding_company_address_country" with "UNITED KINGDOM"
    And I fill in the text field "onboarding_company_name" with "Updated_Requested_Company"
    And I click the "Save Changes" div
    And I click the "Company" link
  
  
######################################################### WIDGETS ############################################################
@wip
  Scenario: Add CFGs to widgets
    And I am on the companies custom fields edit page
    And I click the "Add Custom field" link
    And I add a droplist
    And I am on the company summary config page
    And I wait for "4" seconds
    And I click the "Add a widget" link
    And I wait for "4" seconds
    And I select "Drop List Parent" from "widget_question_id"
    And I wait for "2" seconds
    And I fill in the text field "1" with "Widget CFG"
    And I select "Choices" from "widget_widget_kind"
    And I click the "Save" button
    And I wait for "4" seconds
    Then I should see the text "Widget CFG was added to the Company Summary"
    And I am on my company page
    And I click the "SUMMARY" div
    And I click the "Widget CFG" link
    And I click the "Edit Company" div
    And I select "two" from "1"
    And I click the "SAVE CHANGES" div
    And I click the "SUMMARY" div
    Then I should see the text "two"

  
  