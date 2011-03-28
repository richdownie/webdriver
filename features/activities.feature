@set6
Feature: Activities Feature

Background:
	Given I login with "rdownie@qamail1.rollstream.com"
	And I reset projects and activities
	
Scenario: Company Complete activity
  * I add a "Send a Message" activity to an existing project
  * I click the "1 Activity" link
	* I click row "1" in the "list" table
	* I click the "Edit" div
	* I click the "activity_is_company_completion" checkbox
	* I click the "SAVE" div
	* I should see the text "Companies"
  * I click the "Logout" link

Scenario: Login Required activity
  * I add a "Send a Message" activity to an existing project
  * I click the "1 Activity" link
	* I click row "1" in the "list" table
	* I click the "Edit" div
	* I click the "activity_login_required" checkbox
	* I click the "SAVE" div
	* I should see the text "Participants"
  * I click the "Logout" link

Scenario: Save with no Name to the activity
  Given I add a "Send a Message" activity to an existing project
  And I click the "1 Activity" link
	And I click row "1" in the "list" table
	And I click the "Edit" div
	And I fill in the text field "activity_name" with " "
	And I click the "SAVE" div
	Then I should see the text "Send a Message Activity"
  And I click the "Logout" link
	
Scenario: Change the name of an activity
  Given I add a "Send a Message" activity to an existing project
  And I click the "1 Activity" link
	And I click row "1" in the "list" table
	And I click the "Edit" div
	And I fill in the text field "activity_name" with "Public Enemy #1"
	And I click the "SAVE" div
	Then I should see the text "Public Enemy #1 Activity"
  And I click the "Logout" link
	
Scenario: Change the name of a "STARTED" activity
  Given I add a "Send a Message" activity to an existing project
	And I start the activity
  And I click the "1 Activity" link
	And I click row "1" in the "list" table
	And I click the "Edit" div
	And I fill in the text field "activity_name" with "Public Enemy #1"
	And I click the "SAVE" div
	Then I should see the text "Public Enemy #1 Activity"
  And I click the "Logout" link
	
Scenario: Canceling out of Activity Edit
  Given I add a "Send a Message" activity to an existing project
  And I click the "1 Activity" link
	And I click row "1" in the "list" table
	And I click the "Edit" div
	And I fill in the text field "activity_name" with "Public Enemy #1"
  And I click the "Cancel" div
	Then I should see the text "Send a Message Activity"
  And I click the "Logout" link

Scenario: Canceling out of activity creation at different points
  And I click the "0 Activities" link
  And I click the "new_ui_blue_button_inner" div
  And I click the "Choose this" div
  And I fill in the text field "activity_name" with "Syracuse Orange"
  And I click the "Cancel" div
  Then I should see the text "No Activities"
  
  And I click the "new_ui_blue_button_inner" div
  And I click the "Choose this" div
  And I fill in the text field "activity_name" with "Syracuse Orange"
  And I click the "continue_button" div
  Then I should see the text "Add Participants"
  And I click the "Cancel" div
  Then I should see the text "No Activities"

  And I click the "new_ui_blue_button_inner" div
  And I click the "Choose this" div
  And I fill in the text field "activity_name" with "Syracuse Orange"
  And I click the "continue_button" div
  And I click the "continue_button" div
  And I fill in the text field "email_template_subject" with "Go Orange"
  And I click the "Cancel" div
  Then I should see the text "No Activities"
  And I click the "Logout" link

Scenario: Copy an activity with the original Name
  Given I add a "Send a Message" activity to an existing project
  And I click the "1 Activity" link
	And I click row "1" in the "list" table
	And I click the "Copy" div
	And I fill in the text field "activity_name" with "Send a Message"
	And I click the "COPY" div
	Then I should see the text "Activity 'Send a Message' copied successfully"
  And I click the "Logout" link
	
Scenario: Copy an "STARTED" activity with the original Name
  Given I add a "Send a Message" activity to an existing project
	And I start the activity
  And I click the "1 Activity" link
	And I click row "1" in the "list" table
	And I click the "Copy" div
	And I fill in the text field "activity_name" with "Send a Message"
	And I click the "COPY" div
	Then I should see the text "copied successfully"
  And I click the "Logout" link
	
Scenario: Copy an activity with no Name
  Given I add a "Send a Message" activity to an existing project
  And I click the "1 Activity" link
	And I click row "1" in the "list" table
	And I click the "Copy" div
	And I fill in the text field "activity_name" with " "
	And I click the "COPY" div
	Then I should see the text "Could not copy activity 'Send a Message'"
  And I click the "Logout" link
	
Scenario: Cancel out of the copy operation
  Given I add a "Send a Message" activity to an existing project
	And I start the activity
  And I click the "1 Activity" link
	And I click row "1" in the "list" table
	And I click the "Copy" div
	And I fill in the text field "activity_name" with "Nil"
	And I click the "Cancel" div
	Then I should see the text "Send a Message Activity"
  And I click the "Logout" link
	
Scenario: Remind pending participants of an activity "No Response"
  Given I add a "Send a Message" activity to an existing project
	And I start the activity
  And I click the "1 Activity" link
	And I click row "1" in the "list" table
	And I click the "No Response" link
	And I click the "new_ui_system_button_inner" div
	And I click the "SAVE" div
	Then I should see the text "'Reminder : Subject' was successfully updated."
	Given I remove the original email
	Given I send the reminder message
	Then I should see the text "Reminder Message 'Reminder : Subject' has been sent."
  And I click the "Logout" link
	
Scenario: Remind pending participants of an activity "In Progress"
	Given I add a "Send a Message" activity to an existing project
	And I start the activity
  And I click the "1 Activity" link
	And I click row "1" in the "list" table
	And I click the "PARTICIPANTS" div
	And I click the "new_ui_system_button_inner" div
	And I click the "SAVE" div
	Then I should see the text "'Reminder : Subject' was successfully updated."
	Given I remove the original email
	Given I send the reminder message
	Then I should see the text "Reminder Message 'Reminder : Subject' has been sent."
  And I click the "Logout" link
	
# Make sure there are some participants in each of these states: , , Finished
# Try both picking and choosing participants for reminders as well as using the "Add XX" button
# Try customizing the reminder email
# Try removing some participants from the reminder after having added them to it
# Try editing the reminder email once it's been created
# Try deleting the reminder email
# Try sending out the reminder email

# Scenario: "Resend Last Email" to activity participant
# Try with a participant that has already completed the activity
# Try with an activity that has already been completed
# Try with an unstarted activity
# Try with a participant that has not completed the activity
# Try with a suspended activity

# Scenario: Delete an activity
#   Given this is a todo
# Given I add a "Send a Message" activity to an existing project
# And I start the activity
# And I click the "1 Activity" link
# And I click row "1" in the "list" table
# Then I confirm javascript popup
# Try deleting activities that are in different states
# Try choosing 'no' to the delete confirmation
# Try choosing 'yes' to the delete confirmation
# Cancel 

# Scenario: Start an activity
#   Given this is a todo
# Try starting an activity that has no participants
# Try starting each kind of activity
# Try starting from the "Overview" tab
# Try starting from the "Participants" tab
# Try starting an activity from the project's "Activities" tab

# Scenario: Suspend an activity from the activity's "Overview" tab
#   Given this is a todo
#   # Given I add a "Send a Message" activity to an existing project
#   # And I start the activity
#   # And I click the "1 Activity" link
#   # And I click row "1" in the "list" table
#   # And I click no wait the "Suspend" div
#   # And I click the "Logout" link
# # Suspend an activity from the activity's "Overview" tab
# Try to have a participant access a suspended activity

# Scenario: Resume an activity
#   Given this is a todo
# Resume an activity from the project's "Activities" tab
# Resume an activity from the activity's "Overview" tab
# Try to have a participant access a resumed activity
