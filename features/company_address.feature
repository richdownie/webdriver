Feature: Test the new autocomplete company state text field as well as Contacts

@set1
Scenario Outline:  Edit Company Address
  And I wait for "4" seconds
  Given I login with "rdownie@qamail1.rollstream.com"
  And I wait for "4" seconds
  And I am on the companies page
  And I click the fourth link in the table
  And I wait for "3" seconds
  And I click the "DETAILS" div
  And I click the "Edit Company" div
  And I wait for "3" seconds
  And I fill in the text field "organization_address_state" with <state>
  And I wait for "3" seconds
  And I fill in the text field "organization_address_zip" with <zipcode>
  And I wait for "3" seconds
  And I fill in the text field "organization_address_country" with <country>
  And I click the "SAVE CHANGES" div
  Then I should see the text <result>
  And I click the "Logout" link

    Examples:
    | state      | country          | zipcode      | result                                                |
    | "New Yok"  | "Canada"         | ""           | "is not a valid state/province"                       |
    | "New York" | "United States"  | ""           | "New York"                                            |
    | "Hawaii"   | "United States"  | "44"         | "Address zip should be in 12345 or 12345-1234 format" |
    | "Virgina"  | "United States"  | "ABCDE"      | "Address zip should be in 12345 or 12345-1234 format" |
    | "Kansas"   | "United States"  | "@#*&^$"     | "Address zip should be in 12345 or 12345-1234 format" |
    | "Montreal" | "Canada"         | ""           | "Montreal"                                            |
    | "Montreal" | "United States"  | ""           | "is not a valid state/province"                       |
    | ""         | "United Kingdom" | ""           | "United Kingdom"                                      |
    | ""         | "United Kingdom" | "HH88 43123" | "United Kingdom"                                      |
    | "Albany"   | "Cameroon"       | ""           | "Cameroon"                                            |
 
@set1  
Scenario Outline:  Edit Contact Address
  Given I login with "rdownie@qamail1.rollstream.com"
  And I am on the contacts page
  And I click row "1" in the "list" table
  And I click the "Edit Contact" div
  And I wait for "3" seconds
  And I fill in the text field "person_address_state" with <state>
  And I wait for "3" seconds
  And I fill in the text field "person_address_zip" with <zipcode>
  And I wait for "3" seconds
  And I fill in the text field "person_address_country" with <country>
  And I click the "SAVE CHANGES" div
  Then I should see the text <result>

    Examples:
    | state      | country          | zipcode      | result                                                |
    | "New Yok"  | "Canada"         | ""           | "is not a valid state/province"                       |
    | "New York" | "United States"  | ""           | "New York"                                            |
    | "Hawaii"   | "United States"  | "44"         | "Address zip should be in 12345 or 12345-1234 format" |
    | "Virgina"  | "United States"  | "ABCDE"      | "Address zip should be in 12345 or 12345-1234 format" |
    | "Kansas"   | "United States"  | "@#*&^$"     | "Address zip should be in 12345 or 12345-1234 format" |
    | "Montreal" | "Canada"         | ""           | "Montreal"                                            |
    | "Montreal" | "United States"  | ""           | "is not a valid state/province"                       |
    | ""         | "United Kingdom" | ""           | "United Kingdom"                                      |
    | ""         | "United Kingdom" | "HH88 43123" | "United Kingdom"                                      |
    | "Albany"   | "Cameroon"       | ""           | "Cameroon"                                            |

@wip
Scenario Outline: Edit Registration Address
  Given I login with "rdownie@qamail1.rollstream.com"
  And I remove all existing Onboard Requests
  And I am on the change request page
  And I click the "Continue" button
  And I fill in the text field "onboarding_company_name" with "Titleist44"
  And I fill in the text field "onboarding_company_email" with "title@mail.com"
  And I fill in the text field "onboarding_company_phone" with "444-4444"
  And I fill in the text field "onboarding_company_address_line1" with "Golf Way"
  And I fill in the text field "onboarding_company_address_city" with "Carlsbad"
  And I fill in the text field "onboarding_company_address_state" with <state>
  And I fill in the text field "onboarding_company_address_zip" with <zipcode>
  And I fill in the text field "onboarding_company_address_country" with <country>
  And I click the "Primary Contact" link
  And I fill in the text field "onboarding_contact_first_name" with "Mike"
  And I fill in the text field "onboarding_contact_last_name" with "Requested_Contact"
  And I fill in the text field "onboarding_contact_email" with "rdownie+requested_contact@qamail1.rollstream.com"
  And I fill in the text field "onboarding_contact_work_phone" with "555-555-5555"
  And I click the "Submit Request" div
  And I wait for "3" seconds
  And I fill in the text field "request_first_name" with "Spoke"
  And I fill in the text field "request_last_name" with "Contact"
  And I fill in the text field "request_email" with "rdownie+sc@qamail1.rollstream.com"
  And I fill in the text field "request_phone" with "555-555-5555"
  And I fill in the text field "request_company_name" with "Ping"
  And I click the "onboarding_request_form_button" div
  And I wait for "10" seconds
  Then I should see the text <result>
  And I click the "Close" link
  Then I should see the text "Your Session has been Closed"

    Examples:
    | state        | country          | zipcode      | result                                                |
    | "New York"   | "United States"  | ""           | "Company Zip can't be blank"                          |
    | "Kansas"     | "United States"  | "@#*&^$"     | "Company zip should be in 12345 or 12345-1234 format" |
    | "Hawaii"     | "United States"  | "44"         | "Company zip should be in 12345 or 12345-1234 format" |
    | "Virgina"    | "United States"  | "ABCDE"      | "Company zip should be in 12345 or 12345-1234 format" |
    | ""           | "United Kingdom" | "HH88 43123" | "Company State can't be blank"                        |
    | "California" | ""               | "90293"      | "Company Country can't be blank"                      |

@set1
Scenario: Import Registration Requests with Invalid and Valid Addresses
  Given I login with "rdownie@qamail1.rollstream.com"
  And I remove all existing Onboard Requests
  And I am on the registration requests page
  And I click the "Import" div
	And I upload "Registration_Requests.csv" to the "import_uploaded_data" file field
	And I select "Requester" from "import_request_stage_id"
	And I click the "Next" link
	And I wait for "5" seconds
	And I select "Postal Code" from "import_mappings_importing_company_address_zip"
	And I select "Created Date" from "import_mappings_import_requested_date"
	And I select "Primary Contact First name" from "import_mappings_importing_contact_first_name"
	And I select "Primary Contact Last name" from "import_mappings_importing_contact_last_name"
	And I select "Primary Contact Email" from "import_mappings_importing_contact_email"
	And I select "Primary Contact Phone" from "import_mappings_importing_contact_work_phone"
	And I click the "Next" link
	And I wait for "3" seconds
	And I click the "Next" link
	And I wait for "3" seconds
	Then I should see the text "Your information has been added to the import queue"
	And I click the "Logout" link
