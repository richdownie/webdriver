@set1
Feature: Uploading and Deleting file uplaods from CFs

Background: Setup One time for remaining features
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset existing CFGs

Scenario: Regular Upload-Delete from Companies
  And I am on the companies custom fields edit page
  And I click the "Add Custom field" link
  And I wait for "4" seconds
  And I select "File Upload" from "1"
  And I click the "Next" button
  And I wait for "2" seconds
  And I fill in the text field "3" with "Upload then Delete"
  And I click the "2" button #DONE
  And I wait for "2" seconds
  And I am on the my company page
  And I click the "Edit Company" div
  And I upload "issue_import.csv" to the "1" file field
  And I click the "SAVE CHANGES" div
  Then I should see the text "issue_import.csv"
  And I click the "Edit Company" div
  And I click the "icon_delete" span

Scenario: Regular Upload-Delete from Web Forms
	And I reset projects and activities
  Given I add a "Send a Message" activity to an existing project
	And I click row "1" in the "list" table
	And I click the "WEB FORMS" div
	And I click the "new_ui_blue_button_inner" div
	And I fill in the text field "1" with "Company Form"
	And I click the "3" radio button
	And I click the "SAVE CHANGES" div
	And I wait for "3" seconds
  And I click the "Add Question" link
  And I wait for "3" seconds
  And I select "File Upload" from "1"
  And I click the "Next" button
  And I wait for "3" seconds
  And I click the "2" button #DONE