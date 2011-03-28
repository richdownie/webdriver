@set1
Feature: Support and Help
  In order to value
  As a role
  I want feature

  Scenario: Send email from the login page for a specific community
    Given I am on the logout page
    And I click the "Help" link
    Then I should see the text "Simply click here to send a message to our support team."
    And I wait for "3" seconds
    And I confirm the "click here" link goes to "mailto:"

