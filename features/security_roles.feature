@set6
Feature: Community Roles for *new My Company section
   
Background: Teardown / Setup
   Given I login with "rdownie+pa@qamail1.rollstream.com"
   And I destroy existing perms
   And I set perms for role with "community_view_my_company"     #THIS MUST BE CURRENTLY SET in order for any other perm to work
   And I set perms for role with "community_view_my_contacts"    #THIS MUST BE CURRENTLY SET in order for edit delete enable disable to work
   
 Scenario: Project Administrator can Edit My Company and NOT see other companies
   And I set perms for role with "community_edit_my_company"
   And I am on the my company page
   And I click the "Edit Company" div
   And I fill in the text field "organization_address_line2" with random "Suite "
   And I click the "SAVE CHANGES" div
   Then I should see the text "was successfully updated."
   Then I am on the companies page
   Then I should see the text "No results found"
   And I destroy existing perms
   And I set perms for role with "community_view_my_company"
   And I click the "Logout" link

 Scenario: Project Administrator can Add My Contacts and NOT see other contacts
   And I set perms for role with "community_add_my_contacts"
   And I am on the my company page
   And I click the "Add Contact" div
   Then I am on the contacts page
   Then I should see the text "Access Forbidden"
   And I destroy existing perms
   And I set perms for role with "community_view_my_company"
   And I click the "Logout" link

Scenario: Project Administrator can Edit My Contacts and NOT see other contacts
  And I set perms for role with "community_edit_my_contacts"
  And I am on the my company page
  And I click the "CONTACTS" div
  And I wait for "4" seconds
  And I click row "1" in the "list" table
  And I wait for "4" seconds
  And I click the "Edit Contact" div
  And I wait for "4" seconds
  And I fill in the text field "person_address_line2" with random "Suite "
  And I click the "SAVE CHANGES" div
  Then I am on the contacts page
  And I wait for "4" seconds
  Then I should see the text "Access Forbidden" 
  And I destroy existing perms
  And I set perms for role with "community_view_my_company"
  And I click the "Logout" link
  
Scenario: Project Administrator can Delete My Contacts and NOT see other contacts 
  And I set perms for role with "community_edit_my_contacts"
  And I am on the my company page
  And I click the "CONTACTS" div
  And I wait for "4" seconds
  And I click row "1" in the "list" table
  And I wait for "4" seconds
  And I click the "Delete Contact" div
  Then I am on the contacts page
  And I wait for "4" seconds
  Then I should see the text "Access Forbidden"  
  And I destroy existing perms
  And I set perms for role with "community_view_my_company"
  And I click the "Logout" link
  
Scenario: Project Administrator can View My Contacts and NOT see other contacts
 And I am on the my company page
 Then I should see the text "CONTACTS"
 Then I am on the contacts page
 Then I should see the text "Access Forbidden" 
 And I destroy existing perms
 And I set perms for role with "community_view_my_company"
 And I click the "Logout" link
 
Scenario: Project Administrator can Enable My Contacts and NOT see other contacts
 And I set perms for role with "community_enable_my_contacts"
 And I am on the my company page
 And I click the "CONTACTS" div
 Then I should see the text "Enable Contacts"
 Then I am on the contacts page
 And I wait for "4" seconds
 Then I should see the text "Access Forbidden" 
 And I destroy existing perms
 And I set perms for role with "community_view_my_company"
 And I click the "Logout" link

Scenario: Project Administrator can Disable My Contacts and NOT see other contacts
 And I set perms for role with "community_disable_my_contacts"
 And I am on the my company page
 And I click the "CONTACTS" div
 Then I should see the text "Disable Contacts"
 Then I am on the contacts page
 And I wait for "4" seconds
 Then I should see the text "Access Forbidden" 
 And I destroy existing perms
 And I set perms for role with "community_view_my_company"
 And I click the "Logout" link

#####Additional Non-My Company scenarios 
Scenario: Project Administrator can Edit/View Workspaces and NOT see other contacts
  And I set perms for role with "community_view_workspaces"
  And I set perms for role with "community_update_workspaces"
  And I am on the workspaces page
  Then I am redirected to "workspace_index"
  And I click the "new_ui_blue_button_inner" div
  And I fill in the text field "workspace_name" with "Fake WS"
  And I click the "new_ui_blue_button_inner" div
  And I destroy existing perms
  And I set perms for role with "community_view_workspaces"
  And I am on the workspaces page
  Then I should see the text "Fake WS"
  Then I am on the contacts page
  And I wait for "4" seconds
  Then I should see the text "Access Forbidden"
  And I destroy existing perms
  And I set perms for role with "community_view_my_company"
  And I click the "Logout" link
