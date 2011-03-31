@set1
Feature: Projects Feature
	
Scenario: Verify Project Name validation
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset projects and activities
	And I am on the new projects page
	Then I check for the header and footer
	And I click the "SAVE CHANGES" div
	Then I should see the text "Name can't be blank"
  And I click the "Logout" link
	And I wait for "3" seconds

Scenario: Verify Project Email validations
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset projects and activities
	And I am on the new projects page
	And I fill in the text field "project_name" with random "ProjectName"
	And I fill in the text field "project_reply_to_email_address" with "foobar"
	And I fill in the text field "project_from_email_address" with "foobar"
	And I click the "SAVE CHANGES" div
	Then I should see the text "Reply to email address"
	Then I should see the text "From email address"
  And I click the "Logout" link
	And I wait for "3" seconds

Scenario: Add a new Project and Update the Project
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset projects and activities
	And I click row "0" in the "list" table
  And I click the "EDIT" div 
  And I fill in the text field "project_name" with random "UpdatedProjectName"
  And I click the "SAVE CHANGES" div
  And I click the "Logout" link
	And I wait for "3" seconds
	
Scenario: Copy a Project	
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset projects and activities
	And I click row "0" in the "list" table
	And I click the "COPY" div
	And I fill in the text field "project_name" with random "UpdatedCopyProjectName"
	And I click the "COPY" div
	Then I should see the text "UpdatedCopyProjectName"
  And I click the "Logout" link
	And I wait for "3" seconds

Scenario: Edit a Project	
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset projects and activities
	And I click row "0" in the "list" table
	And I wait for "3" seconds
	And I click the "EDIT" div
	And I fill in the text field "project_name" with random "Updated Project Name"
	And I fill in the text field "project_description" with "Updated Description"
	And I click the "SAVE CHANGES" div
	Then I should see the text "successfully updated"
  And I click the "Logout" link
	And I wait for "3" seconds

Scenario: Add an Activity to a New Project
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset projects and activities
	And I click row "0" in the "list" table
  And I click the "ACTIVITIES" div
  And I click the "new_ui_blue_button_inner" div
  And I click the "Choose this" div
  And I fill in the text field "activity_name" with random "Activity"
  And I fill in the text field "activity_description" with "ActivityDescription"
  And I click the "1" checkbox
    And I click the "continue_button" div
    And I click the "continue_button" div
    And I click the "SAVE" div
    And I click the "Logout" link
  And I wait for "3" seconds

Scenario: Add a Web Form to a New Project
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset projects and activities
	And I click row "0" in the "list" table
  And I click the "WEB FORMS" div
  And I am on the new page
  And I fill in the text field "form_name" with random "WebForm"
  And I fill in the text field "form_description" with "WebFormDescription"
  And I click the "form_type_anonymous" radio button
  And I click the "form_type_public" radio button
  And I click the "SAVE CHANGES" div
  And I click the "new_ui_blue_button_inner" div
  And I click the "Logout" link
  And I wait for "3" seconds

Scenario: Copy Team Members
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset projects and activities
  And I click row "0" in the "list" table
	And I click the "TEAM" div
	And I click the "new_ui_blue_button_inner" div
	And I click the "Add" div
  And I click the "new_ui_blue_button_inner" div
  And I click the "Logout" link
	And I wait for "3" seconds
	
Scenario: Create Activity Managed Project	
# Create a new project with "Copy Team Members on All Communications" selected
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset projects and activities
  And I am on the new projects page 
  And I fill in the text field "project_name" with random "ProjectName"
 	And I fill in the text field "project_description" with "ProjectDescription"
	And I fill in the text field "project_reply_to_email_address" with "rdownie@qamail1.rollstream.com"
	And I fill in the text field "project_from_email_address" with "rdownie@qamail1.rollstream.com"
	And I click the "1" checkbox
	And I fill in the text field "project_starts_at_ui" with "Dec 10, 2009"
	And I click the "project_is_auto_reschedule" checkbox
	And I click the "project_activity_email_to_team" checkbox
	And I click the "SAVE CHANGES" div
  # Create an activity
	And I click the "ACTIVITIES" div
	And I wait for "3" seconds
	And I click the "ADD ACTIVITY" div
	And I click the "Choose this" div
	And I fill in the text field "activity_name" with random "Activity"
	And I fill in the text field "activity_description" with "ActivityDescription"
  # And I click the "0" checkbox
  # And I click the "1" checkbox
	And I click the "continue_button" div
  # Be sure to add both Team Members and Participants
	And I add a Participant to the Activity
  #Add Due Date to Activity
	And I click the "1 Activity" link
	And I click the "DEPENDENCIES AND DUE DATES" div
	And I click the "1" checkbox
	And I fill in the text field "due_date" with "Jan 01, 2020"
	And I click the "SAVE CHANGES" div
  #Start the Project Activity
	And I click the "Your Projects" link
	And I click row "0" in the "list" table
	And I click the "START PROJECT" div
	Then I should see the text "has been started"
  And I click the "Logout" link
	

# Scenario: Verify that all team members get copied on the email	
# Start the project
# Verify that all team members get copied on the email
# "Remind Pending" to all participants
# Verify that all team members get copied on the reminder email

# @wip
# Scenario: Create Activity Managed Project
# Try adding no start date when creating
# Try creating with/without automatic scheduling
# Try creating with/without send project kickoff email

# Try copying an empty (no activities) AM Project
# Try copying an AM Project that has activities