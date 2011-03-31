Feature: Testing Terms of Service

Background:
Given I login with "rdownie@qamail1.rollstream.com"
  And I reset terms of service
  And I click the "Logout" link

@set1  
Scenario Outline: Verify Terms of Service once appears for spoke users
  Given I login with <user>
  And I am on <page>
  And I wait for "4" seconds
  And I click the <button> button
  Then I should see the text <result>
  
  Examples:
  | user                                     | page            | button    | result            |
  | "rdownie+jabbott@qamail1.rollstream.com" | "the home page" | "Reject" | "Community Login" |
  | "rdownie+jabbott@qamail1.rollstream.com" | "the home page" | "ACCEPT" | "INBOX"           |
  
@firefox
Scenario: Verify Terms of Service appears once for brokers
  Given I login with "rdownie+jbroker@qamail1.rollstream.com"
  And I am on the home page
  And I wait for "4" seconds
  And I click broker link with index of "0"
  And I click the "ACCEPT" button
  Then I should see the text "DASHBOARD"
  And I click the "Logout" link
  Given I login with "rdownie+jbroker@qamail1.rollstream.com"
  And I click broker link with index of "1"
  Then I should see the text "DASHBOARD"
  And I click the "Logout" link

@set1  
Scenario: Spoke accepts ToU, CA changes value, Spoke accepts ToU again
  Given I login with "rdownie+jabbott@qamail1.rollstream.com"
  And I click the "ACCEPT" button
  And I click the "Logout" link
	Given I login with "rdownie@qamail1.rollstream.com"
  And I update the terms of use
  And I click the "Logout" link
  Given I login with "rdownie+jabbott@qamail1.rollstream.com"
  And I click the "ACCEPT" button
  And I click the "Logout" link

@set1  
Scenario: All stable link paths (ToU should be triggered)
  Given I login with "rdownie+jabbott@qamail1.rollstream.com"
  Given I go to the stable link for company "NSC1234"
  Then I am redirected to "acceptance/terms_of_use"

@set1  
Scenario: Anonymous registration requests (where ToS does not apply)
  Given I login with "rdownie+jabbott@qamail1.rollstream.com"
  And I remove all existing Onboard Requests
  And I am on the change request page
  And I click the "Continue" button
  Then I am redirected to "anonymous_requests/new"

@set1	
Scenario Outline: All other links into the system (ToU triggered on activity, workspace, issues, change management)
  Given I login with <user>
  And I am on <page> 
  Then I am redirected to <redirect>
  
  Examples:
  | user                                     | page                          | redirect                    |
  | "rdownie+jabbott@qamail1.rollstream.com" | "the admin page"              | "acceptance/terms_of_use"   |
  | "rdownie+jabbott@qamail1.rollstream.com" | "the items page"              | "acceptance/terms_of_use"   |
  | "rdownie+jabbott@qamail1.rollstream.com" | "the community settings page" | "acceptance/terms_of_use"   |
  | "rdownie+jabbott@qamail1.rollstream.com" | "the my profile page"         | "acceptance/terms_of_use"   |
  | "rdownie+jabbott@qamail1.rollstream.com" | "the projects page"           | "acceptance/terms_of_use"   |
  | "rdownie+jabbott@qamail1.rollstream.com" | "the issues page"             | "acceptance/terms_of_use"   |

  