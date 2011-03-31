@set2 @ws
Feature: Adding Files and Folder Scenarios

Background:
Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Workspaces data
  And I am on the workspaces page
  And I click the "View" div

Scenario: Add a Folder
  And I click the "View All Files" link
  Then I should see the text "The Elmira Express"
  Then I should see the text "WishBone"
  And I click the "New Folder" link
  And I fill in the text field "folder_name" with "SampleFolder"
  And I click the "Add Folder" button
  And I click the "Logout" link

Scenario: Add/Delete a File
  And I click the "View All Files" link
  And I click the "Add File" link
  And I upload "issue_import.csv" to the "files_uploaded_0_uploaded_data" file field
  And I click the "Upload File" button
  And I wait for "3" seconds
  And I click the "Delete" link
  And I wait for "3" seconds
  And I click the "workspace_button red" button
  
Scenario: Add File to Folder  
  And I click the "Start a Conversation" link
  And I fill in the text field "1" with "Hello World!"
  And I fill in the text field "2" with "I'm about to upload this file, please respond"
  And I click the "Attach a File" link
  And I wait for "2" seconds
  And I click the "1" checkbox
  And I click the "Choose a different folder" link
  And I click the "WishBone" link
  And I upload "issue_import.csv" to the "topic_posts_attributes_0_files_attributes_0_uploaded_data" file field
  And I click the "Create Conversation" button
  And I am on the workspaces page
  And I click the "View" div
  And I click the "View All Files" link
  And I click the "WishBone" link
  Then I should see the text "issue_import.csv"
  
Scenario: Rename a Folder
  And I click the "View All Files" link
  And I click the "WishBone" link
  And I click the "Rename" link
  Then I fill in the text field "content_library_folder_name" with "WishBoneRenamed"
  And I click the "Rename" button