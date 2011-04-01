@set2
Feature: Groups
  In order to interact with only the companies I do business with regularly
  as a user with the appropriate permissions
  I want to filter the companies in the RollStream community by group

  Background:
    Given I login with "rdownie@qamail1.rollstream.com"
    And I reset the Groups data

  Scenario Outline: Create a Group
    Given I login with <login_id>
    And I am on the companies page
    When I click the "New" link
    And I fill in the text field "organization_group_name" with <name>
    And I fill in the text field "organization_group_description" with <description>
    And I click the "commit" button
    #And I wait for "2" seconds
    Then I should see the text <text>
    Examples:                                                   
    | login_id                              | name              | description                       | text                          |
    | "rdownie@qamail1.rollstream.com"      | "Underperforming" | "these companies have low scores" | "was successfully created."   |
    | "rdownie@qamail1.rollstream.com"      | ""                | "there is no name provided"       | "Name can't be blank"         |
    | "rdownie@qamail1.rollstream.com"      | "GROUp1"          | ""                                | "Name has already been taken" |
    | "sbourdeau+hg@qamail1.rollstream.com" | "Underperforming" | "these companies have low scores" | "was successfully created."   |
    | "sbourdeau+hg@qamail1.rollstream.com" | ""                | "there is no name provided"       | "Name can't be blank"         |
    | "sbourdeau+hg@qamail1.rollstream.com" | "gRoUp3"          | ""                                | "Name has already been taken" |
   
  Scenario Outline: Edit a Group
    Given I login with <login_id>
    And I am on the companies page
    And I click the <link_name> link
    And I click the "Manage Group" link
    When I click the "Edit Group" link
    And I fill in the text field "organization_group_name" with <name>
    And I fill in the text field "organization_group_description" with <description>
    And I click the "commit" button
    Then I should see the text <text>

    Examples:
    | login_id                              | link_name    | name     | description                 | text                   |
    | "rdownie@qamail1.rollstream.com"      | "(0) Group5" | "Edited" | ""                          | "was updated"          |
    | "rdownie@qamail1.rollstream.com"      | "(0) Group3" | ""       | "my description of Group 3" | "Name can't be blank"  |
    | "sbourdeau+hg@qamail1.rollstream.com" | "(0) Group6" | "Edited" | ""                          | "was updated"          |
    | "sbourdeau+hg@qamail1.rollstream.com" | "(0) Group4" | ""       | "my description of Group 4" | "could not be updated" |
    | "sbourdeau+hg@qamail1.rollstream.com" | "(0) Group2" | "GrOuP3" | ""                          | "could not be updated" |

# Need Andrew to change the javascript popup to something else
@wip
  Scenario Outline: Delete a Group
	Given I login with <login_id>
	And I am on the groups page
	When I click the multiple criteria "icon delete" link in position "4"
	And I hammer the ok js
	Then I should see the text <text>

    Examples:
 | login_id                         | text          |
 | "rdownie@qamail1.rollstream.com" | "was deleted" |
    
