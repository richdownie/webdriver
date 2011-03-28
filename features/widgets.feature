@firefox
Feature: Widgets
  In order to monitor the performance of a company by certain KPIs
  as a user with the permission to view companies
  I want to see visual status indicators on a company summary page

  Background:
    Given I login with "rdownie@qamail1.rollstream.com"
    And I reset the Widgets data
    And I reset existing CFGs

  Scenario Outline: Add a widget of each type and available treatment
    Given I login with <login_id>
    And I am on the companies page
    And I click the "Settings" link
    And I click the "Summary Page" link
    When I click the "Add a widget" link
    And I select <field_name> from "widget_question_id"
    And I fill in the text field "widget_title" with <widget_name>
    And I select <treatment> from "widget_widget_kind"
    And I click the "Save" button
    Then I should see the text <text>
    Examples:
      | login_id | field_name | widget_name | treatment | text |
      | "rdownie@qamail1.rollstream.com" | "Widget Drop List" | "Drop List Widget" | "Choices" | "added to the Company Summary" |
      | "rdownie@qamail1.rollstream.com" | "Widget Multiple Choice" | "MC Widget" | "Choices" | "added to the Company Summary" |
      | "rdownie@qamail1.rollstream.com" | "Widget Radio" | "Radio Widget" | "Choices" | "added to the Company Summary" |
      | "rdownie@qamail1.rollstream.com" | "Widget True False" | "True False Widget" | "Text" | "added to the Company Summary" |
      | "rdownie@qamail1.rollstream.com" | "Widget Yes No" | "Yes No Widget" | "Text" | "added to the Company Summary" |
      | "rdownie@qamail1.rollstream.com" | "Widget Text" | "Text Widget" | "Text" | "added to the Company Summary" |
      | "rdownie@qamail1.rollstream.com" | "Widget Number" | "Number Widget" | "Text" | "added to the Company Summary" |
      | "rdownie@qamail1.rollstream.com" | "Widget Date" | "Date Widget" | "Text" | "added to the Company Summary" |
      | "rdownie@qamail1.rollstream.com" | "Widget Text Area" | "Text Area Widget" | "Text" | "added to the Company Summary" |
      | "rdownie@qamail1.rollstream.com" | "Widget File Upload" | "File Upload Widget" | "File Link" | "added to the Company Summary" |
      | "rdownie@qamail1.rollstream.com" | "Widget Number Formula" | "Number Formula Widget" | "Text" | "added to the Company Summary" |
      | "rdownie@qamail1.rollstream.com" | "Widget Date Formula" | "Date Formula Widget" | "Text" | "added to the Company Summary" |
      | "rdownie@qamail1.rollstream.com" | "Widget True False Formula" | "True False Formula Widget" | "Text" | "added to the Company Summary" |
      | "rdownie@qamail1.rollstream.com" | "Widget Drop List" | "Drop List Widget" | "Selected" | "added to the Company Summary" |
      | "rdownie@qamail1.rollstream.com" | "Widget Multiple Choice" | "MC Widget" | "Selected" | "added to the Company Summary" |
      | "rdownie@qamail1.rollstream.com" | "Widget Radio" | "Radio Widget" | "Selected" | "added to the Company Summary" |
      | "rdownie@qamail1.rollstream.com" | "Widget True False" | "True False Widget" | "Icon" | "added to the Company Summary" |
      | "rdownie@qamail1.rollstream.com" | "Widget Yes No" | "Yes No Widget" | "Icon" | "added to the Company Summary" |
      | "rdownie@qamail1.rollstream.com" | "Widget Date" | "Date Widget" | "Calendar" | "added to the Company Summary" |
      | "rdownie@qamail1.rollstream.com" | "Widget Date Formula" | "Date Formula Widget" | "Calendar" | "added to the Company Summary" |
      | "rdownie@qamail1.rollstream.com" | "Widget True False Formula" | "True False Formula Widget" | "Icon" | "added to the Company Summary" |
              