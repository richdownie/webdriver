Feature: Mass File Upload
  In order to keep all companies up-to-date
  as a user with the appropriate permissions
  I want to mass upload files to a file upload field within each company

  #TODO: Need a Background to clear out all files from the upload field first

  Scenario: Upload a basic zip file as a Community Administrator
    Given I login with "rdownie@qamail1.rollstream.com"
    When I am on the companies page
    And I fire the company manage menu
    And I click the "Upload Files" link
    And I should see the text "Upload Files to Company Profiles"
    And I upload "All_Valid_Files.zip" to the "mass_file_upload_uploaded_data" file field
    And I select "File Upload" from "mass_file_upload_question_id"
    And I fill in the text field "mass_file_upload_file_suffix" with "Test"
    And I submit the form "new_mass_file_upload"
    Then I should see the text "Your request to import files has been submitted to RollStream."
    And I wait for "15" seconds
    Then I should verify that all files were successfully uploaded
      | id | company_id       |
      | 24 | With.Dot         |
      #| 25 | With Some Spaces |
      #| 26 | ?????????????? |

  Scenario Outline: Exception Cases
    Given I login with "rdownie@qamail1.rollstream.com"
	When I am on the companies page
    And I fire the company manage menu
    And I click the "Upload Files" link
	And I upload <filename> to the "mass_file_upload_uploaded_data" file field
    And I select "File Upload" from "mass_file_upload_question_id"
    And I fill in the text field "mass_file_upload_file_suffix" with <suffix>
    And I submit the form "new_mass_file_upload"
    Then I should see the text <flashtext>
    
    Examples:
    | filename | suffix | flashtext |
    # Compressed file types that are not zip files
    | "test.rar"        | "Bad File" | "must be a zip archive" |
    | "aaperdiv101.gz"  | "Bad File" | "must be a zip archive" |
    | "aaperdiv101.tgz" | "Bad File" | "must be a zip archive" |
    # A regular file that is not a zip file
    | "Registration_Requests.csv" | "Bad File" | "must be a zip archive" |
    # No File Suffix
    | "All_Valid_Files.zip" | "" | "can't be blank" |
    # No file suffix and a bad file at the same time
    | "Registration_Requests.csv" | "" | "please review the errors below" |

    
