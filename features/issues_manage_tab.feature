@set3
Feature: Who has access to Issue Management Link under Applications

Scenario: Setting up for below scenarios:
Given I login with "rdownie@qamail1.rollstream.com"
  And I am on the edit shipping issue type page
  Then I click the "Logout" link
    
Scenario Outline: Testing /issues_dasboard security access
  Given I login with <email>
  And I am on the issues dashboard page
  And I wait for "3" seconds
  Then I should see the div <div>

  Examples:
    | email                                         | div                 |
    | "rdownie+jcreator@qamail1.rollstream.com"     | "Access Forbidden"  |
    | "rdownie+jmediator@qamail1.rollstream.com"    | "Access Forbidden"  |
    | "rdownie+jparticipant@qamail1.rollstream.com" | "Access Forbidden"  |
    | "rdownie+sc@qamail1.rollstream.com"           | "Access Forbidden"  |
    | "rdownie+pa@qamail1.rollstream.com"           | "Access Forbidden"  |
    | "rdownie+ca@qamail1.rollstream.com"           | "Access Forbidden"  |
    | "rdownie+employee@qamail1.rollstream.com"     | "Access Forbidden"  |
    | "rdownie+jmanager@qamail1.rollstream.com"     | "DASHBOARD"         |
    | "rdownie@qamail1.rollstream.com"              | "DASHBOARD"         |