@set2 @ws
Feature: Workspace Events

Background:
Given I login with "rdownie@qamail1.rollstream.com"
  And I am on the workspaces page
  And I click the "View" div

Scenario: Quick Add an Event to a Workspace
  And I click the "Add Event" link
  And I fill in the text field "calendar_event_title" with "Quick Add New Event"
  And I fill in the text field "calendar_event_description" with "Quick Add New Event"
  And I click the "Add Event" button
  And I wait for "3" seconds
  And I click the "View All Events" link
  And I click the "Logout" link    

Scenario: Standard Add an Event to a Workspace
  And I click the "View All Events" link
  And I click the "Add an event" link
  And I fill in the text field "calendar_event_title" with "Standard Add New Event"
  And I fill in the text field "calendar_event_description" with "Standard Add New Event"
  And I fill in the text field "new_calendar_event_start_date" with "10/31/2011"
  And I fill in the text field "new_calendar_event_start_time" with "08:00 PM"
  And I fill in the text field "new_calendar_event_end_date" with "11/01/2011"
  And I fill in the text field "new_calendar_event_end_time" with "10:00 PM"
  And I click the "calendar_event_require_email_reminder" checkbox
  And I select "3" from "calendar_event_remind_days_before"
  And I select "3" from "calendar_event_remind_days_before"
  And I click the "Add Event" button
  And I click the "Logout" link