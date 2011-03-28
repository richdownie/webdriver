@set2 @ws
Feature: Workspace member scenarios

  Background: Setup Workspaces and go to index page
    Given I login with "rdownie+wa@qamail1.rollstream.com"
    And I reset the Workspaces data
    And I am on the workspaces page

  Scenario Outline: Quick add a workspace member
    Given I click the "View" div
    And I click the "Add Member" link
    And I fill in the text field "email" with <contact email>
    When I click the "Add Member" button
    And I wait for "2" seconds
    Then I should see the text <contact name>

    Examples: 
      | contact email                       | contact name                   |
      | "rdownie+sc@qamail1.rollstream.com" | "Contact, Spoke"               |
      | "wendell.alexis@example.org"        | "Alexis, Wendell"              |
      | "mhuff@nothere.org"                 | "email address was not found " |

   Scenario Outline: Add a workspace member from the Add/Manage Members page
     Given I click the "View" div
     And I click the "View/Manage Members" link
     And I fill in the text field "terms_quick_search" with <search string>
     And I click the "search" button
     And I wait for "2" seconds
     And I click the "7" checkbox
     And I select <role name> from "role"
     And I click the "add" button
     And I wait for "2" seconds
     Then I should see the text <text>

     Examples:
       | search string  | role name                 | text                           |
       | "bourd"        | "Editor"                  | "2 members found in workspace" |
       | "bourd"        | "Observer"                | "2 members found in workspace" |
       | "down"         | "Workspace Administrator" | "2 members found in workspace" |
