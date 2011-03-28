@firefox
Feature: Mass File Download
  In order to easily gather files for each company in my community
  as a user with the appropriate permissions
  I want to mass download files from a file upload field from each company

  Scenario: Download a zip file containing all files uploaded into a specific company file upload custom field
    Given I login with "rdownie@qamail1.rollstream.com"
    When I am on the companies page
    And I click the "all" radio button
    And I select "Download Company Files" from "bulk_operations"
    And I click the "OK" link
    And I should see the text "Export Files"
    And I wait for "2" seconds
    And I select "File Upload" from "question_id"
    And I wait for "2" seconds
    And I fill in the text field "file_suffix" with "test"
    And I click the "primary" button
    And I wait for "3" seconds