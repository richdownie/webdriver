@set3
Feature: Import different types of files and values
  
Scenario: xls => FAIL
Given I login with "rdownie@qamail1.rollstream.com"
  And I am on the company import page
  And I upload "Companies.xls" to the "import_uploaded_data" file field
  And I click the "Next" link
  Then I should see the text "There are problems with the import file. Please be sure the file is in a comma separated values (CSV) format."
  And I click the "Logout" link

Scenario: csv
	Given I login with "rdownie@qamail1.rollstream.com"
  And I am on the company import page
  And I upload "Companies.csv" to the "import_uploaded_data" file field
	And I click the "Next" link
  And I select "Company Name" from "import_mappings_Name"
  And I select "Company ID" from "import_mappings_Company_ID"
  And I select "Email Address" from "import_mappings_Email"
  And I select "Phone" from "import_mappings_Phone"
  And I select "Fax" from "import_mappings_Fax"
  And I select "Street Address" from "import_mappings_Address_Line1"
  And I select "Address Line2" from "import_mappings_Address_Line2"
  And I select "Address Line3" from "import_mappings_Address_Line3"
  And I select "City" from "import_mappings_Address_City"
  And I select "State" from "import_mappings_Address_State"
  And I select "Country" from "import_mappings_Address_Country"
  And I select "Notes" from "import_mappings_Notes"
  And I select "Zipcode" from "import_mappings_Address_Zip"
	And I click the "Next" link
	And I wait for "3" seconds
	And I click the "Next" link
	And I wait for "3" seconds
	And I click the "Go to Companies." link
	And I click the "Logout" link

Scenario: csv with a bad email address
	Given I login with "rdownie@qamail1.rollstream.com"
 	And I am on the company import page
	Then I check for the header and footer
	And I upload "companies_bad_email.csv" to the "import_uploaded_data" file field
	And I click the "Next" link
  And I select "Company Name" from "import_mappings_Name"
  And I select "Company ID" from "import_mappings_Company_ID"s
  And I select "Email Address" from "import_mappings_Email"
	And I click the "Next" link
	And I click the "Next" link
	And I click the "Next" link
  And I click the "Logout" link
