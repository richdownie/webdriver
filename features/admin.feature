@set5
Feature: Admin Scenarios

Scenario Outline: Available to Community Administrator Only
	Given I login with <user>
	And I wait for "3" seconds
	And I am on the admin page
	And I wait for "3" seconds
  
  Examples:
  | user |
  | "rdownie+sc@qamail1.rollstream.com" |
  | "rdownie+pa@qamail1.rollstream.com" |
  | "rdownie+sc@qamail1.rollstream.com" |
  | "rdownie+employee@qamail1.rollstream.com" |
  | "rdownie@qamail1.rollstream.com" |

Scenario: Manage Default Permissions For New Projects 
	Given I login with "rdownie@qamail1.rollstream.com"
  And I am on the default project permissions page
  Then I should see the text "Participant"
  Then I should see the text "Team"
  Then I should see the text "Project Owner"
  # Then I should see the text "Community Administrator"
  Then I should see the text "Activities"
  Then I should see the text "Files"
  Then I should see the text "Milestones"
  Then I should see the text "Projects"
  Then I should see the text "Web Forms"
  And I click the "Logout" link

Scenario: View Community Level Permissions
	Given I login with "rdownie@qamail1.rollstream.com"
  And I am on the community settings page
  And I click the "new_ui_blue_button_inner" div
  And I fill in the text field "community_name" with "Update"
  And I click the "community_enable_company_divisions" checkbox
  And I fill in the text field "community_session_expiration_interval" with "100"
  And I fill in the text field "community_from_email_address" with "test"
  And I fill in the text field "community_reply_to_email_address" with "test"
  And I click the "community_enable_generate_company_id" checkbox
  And I click the "Cancel" div