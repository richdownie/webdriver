@set1
Feature: Home Tab

Scenario: Setup
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I setup the issue type
  And I click the "Logout" link
  Given I login with "rdownie+hcreator@qamail1.rollstream.com"
  And I am on the new issues page
  And I add an issue with company "Owens & Minor" with color "orange"
  And I click the "Logout" link

Scenario Outline: Open status assigned_to_person scope
  Given I login with <email>
  And I am on the issues home tab page
  Then I should see the text <text>
  And I click the "View by Issue Type" link
  Then I should see the text <text>
  And I click the "Logout" link
  
  Examples:
    | email                                         | text                |
    | "rdownie+jcreator@qamail1.rollstream.com"     | "No results found." |
    | "rdownie+hcreator@qamail1.rollstream.com"     | "No results found." |
    | "rdownie+jparticipant@qamail1.rollstream.com" | "Owens & Minor"     |
    | "rdownie+hparticipant@qamail1.rollstream.com" | "No results found." |
    | "rdownie+jmediator@qamail1.rollstream.com"    | "Owens & Minor"     |
    | "rdownie+hmediator@qamail1.rollstream.com"    | "No results found." |
    | "rdownie+jmanager@qamail1.rollstream.com"     | "Owens & Minor"     |
    | "rdownie+hmanager@qamail1.rollstream.com"     | "No results found." |
    | "rdownie@qamail1.rollstream.com"              | "No results found." |
    
Scenario: Change Line Item to Pending Status
  Given I login with "rdownie@qamail1.rollstream.com"
  And I am on the Issues page
  And I click the "MANAGE LINE ITEMS" div
  And I click the "enableAllCheckbox" checkbox
  And I select "Mark Pending" from "bulkOperations"
  And I click the "Update" link
  And I click the "Proceed With Update" button
  And I click the "Click here" link
  And I click the "Logout" link
  
Scenario Outline: Pending status assigned_to_person scope
  Given I login with <email>
  And I am on the issues home tab page
  Then I should see the text <text>
  And I click the "View by Issue Type" link
  Then I should see the text <text>
  And I click the "Logout" link

  Examples:
    | email                                         | text                |
    | "rdownie+jcreator@qamail1.rollstream.com"     | "No results found." |
    | "rdownie+hcreator@qamail1.rollstream.com"     | "No results found." |
    | "rdownie+jparticipant@qamail1.rollstream.com" | "No results found." |
    | "rdownie+hparticipant@qamail1.rollstream.com" | "No results found." |
    | "rdownie+jmediator@qamail1.rollstream.com"    | "No results found." |
    | "rdownie+hmediator@qamail1.rollstream.com"    | "Owens & Minor"     |
    | "rdownie+jmanager@qamail1.rollstream.com"     | "No results found." |
    | "rdownie+hmanager@qamail1.rollstream.com"     | "Owens & Minor"     |
    | "rdownie@qamail1.rollstream.com"              | "No results found." |
    
Scenario: Change Line Item to Resolved Status
  Given I login with "rdownie@qamail1.rollstream.com"
  And I am on the Issues page
  And I click the "MANAGE LINE ITEMS" div
  And I click the "enableAllCheckbox" checkbox
  And I select "Mark Resolved" from "bulkOperations"
  And I click the "Update" link
  And I click the "Proceed With Update" button
  And I click the "Click here" link
  And I click the "Logout" link  
  
Scenario Outline: Resolved status assigned_to_person scope
  Given I login with <email>
  And I am on the issues home tab page
  Then I should see the text <text>
  And I click the "View by Issue Type" link
  Then I should see the text <text>
  And I click the "Logout" link

  Examples:
    | email                                         | text                |
    | "rdownie+jcreator@qamail1.rollstream.com"     | "No results found." |
    | "rdownie+hcreator@qamail1.rollstream.com"     | "No results found." |
    | "rdownie+jparticipant@qamail1.rollstream.com" | "No results found." |
    | "rdownie+hparticipant@qamail1.rollstream.com" | "No results found." |
    | "rdownie+jmediator@qamail1.rollstream.com"    | "No results found." |
    | "rdownie+hmediator@qamail1.rollstream.com"    | "No results found." |
    | "rdownie+jmanager@qamail1.rollstream.com"     | "No results found." |
    | "rdownie+hmanager@qamail1.rollstream.com"     | "Owens & Minor"     |
    | "rdownie@qamail1.rollstream.com"              | "No results found." |

Scenario: Change Line Item to Closed Status
  Given I login with "rdownie@qamail1.rollstream.com"
  And I am on the Issues page
  And I click the "MANAGE LINE ITEMS" div
  And I click the "enableAllCheckbox" checkbox
  And I select "Mark Closed" from "bulkOperations"
  And I click the "Update" link
  And I click the "Proceed With Update" button
  And I click the "Click here" link
  And I click the "Logout" link  

Scenario Outline: Closed status assigned_to_person scope
  Given I login with <email>
  And I am on the issues home tab page
  Then I should see the text <text>
  And I click the "View by Issue Type" link
  Then I should see the text <text>
  And I click the "Logout" link

  Examples:
    | email                                         | text                |
    | "rdownie+jcreator@qamail1.rollstream.com"     | "No results found." |
    | "rdownie+hcreator@qamail1.rollstream.com"     | "No results found." |
    | "rdownie+jparticipant@qamail1.rollstream.com" | "No results found." |
    | "rdownie+hparticipant@qamail1.rollstream.com" | "No results found." |
    | "rdownie+jmediator@qamail1.rollstream.com"    | "No results found." |
    | "rdownie+hmediator@qamail1.rollstream.com"    | "No results found." |
    | "rdownie+jmanager@qamail1.rollstream.com"     | "No results found." |
    | "rdownie+hmanager@qamail1.rollstream.com"     | "No results found." |
    | "rdownie@qamail1.rollstream.com"              | "No results found." |
        
Scenario: Left hand for_person scope all stati
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data
  And I am on the Issues page
  And I click the "ADMIN" div
  And I click the "Create Issue Type" link
  And I fill in the text field "1" with "Pricing"
  And I fill in the text field "2" with "PR-44"
  And I fill in the text field "3" with "30"
  And I fill in the text field "4" with "7"
  And I fill in the text field "5" with "rdownie@rollstream.com"
  And I fill in the text field "6" with "rich@richdownie.com"
  And I click the "Save" button
  Given I am on the issue types Admin page
  And I click the "Pricing" link
  And I click the "Issue Custom Fields" link
  And I click the "Text" link
  And I fill in the text field "1" with "PR-Issue Question"
  And I click the "SAVE" link
  Given I am on the issue types Admin page
  And I click the "Pricing" link
  And I click the "Line Item Custom Fields" link
  And I click the "Text" link
  And I fill in the text field "1" with "PR-Line Item Question"
  And I click the "SAVE" link
  Given I am on the issue types Admin page
  And I click the "Shipping Dispute" link
  And I click the "Issue Custom Fields" link
  And I click the "Text" link
  And I fill in the text field "1" with "SD-Issue Question"
  And I click the "SAVE" link
  Given I am on the issue types Admin page
  And I click the "Shipping Dispute" link
  And I click the "Line Item Custom Fields" link
  And I click the "Text" link
  And I fill in the text field "1" with "SD-Line Item Question"
  And I click the "SAVE" link
  And I click the "ADD ISSUES" link
  And I select "Owens & Minor" from "1"
  And I fill in the text field "1" with "SD-Issue"
  And I fill in the text field "2" with "SD-Closed"
  And I fill in the text field "3" with "1/1/2000"
  And I fill in the text field "4" with "SD-Pending"
  And I fill in the text field "5" with "1/1/2020"
  And I fill in the text field "6" with "SD-Resolved"
  And I fill in the text field "8" with "SD-Open"
  And I fill in the text field "9" with "1/1/2000"
  And I click the "SAVE" button
  And I wait for "3" seconds
  And I click the "ADD ISSUES" div
  # And I click the "Pricing" link
  And I select "Owens & Minor" from "1"
  And I fill in the text field "1" with "PR-Issue"
  And I fill in the text field "2" with "PR-Closed"
  And I fill in the text field "3" with "1/1/2000"
  And I fill in the text field "4" with "PR-Pending"
  And I fill in the text field "5" with "1/1/2020"
  And I fill in the text field "6" with "PR-Resolved"
  And I fill in the text field "8" with "PR-Open"
  And I fill in the text field "9" with "1/1/2000"
  And I click the "SAVE" button

  # And I create all line item stati
  #  Given I am on the issues home tab page
  #  Then I should see the text "Pricing"
  #  Then I should see the text "Shipping Dispute"
  #  
  #  And I click "1" link in "c-1 summary"
  #  Then I should see the text "PR-Open"
  #  Given I am on the issues home tab page
  #  
  #  And I click "2" link in "c-1 summary"
  #  Then I should see the text "Open"
  #  Given I am on the issues home tab page
  #  
  #  And I click "3" link in "c-1 summary"
  #  Then I should see the text "PR-Pending"
  #  Given I am on the issues home tab page
  #  
  #  And I click "4" link in "c-1 summary"
  #  Then I should see the text "Pending"
  #  Given I am on the issues home tab page
  #  
  #  And I click "5" link in "c-1 summary"
  #  Then I should see the text "PR-Resolved"
  #  Given I am on the issues home tab page
  #  
  #  And I click "6" link in "c-1 summary"
  #  Then I should see the text "Resolved"
  #  Given I am on the issues home tab page
  #  
  #  And I click "7" link in "c-1 summary"
  #  Then I should see the text "PR-Closed"
  #  Given I am on the issues home tab page
  #  
  #  And I click "8" link in "c-1 summary"
  #  Then I should see the text "Closed"
  #  Given I am on the issues home tab page
  #  
  #  And I click "1" link in "c-1 summary"
  #  And I click the "PR-Open" link
  #  And I click the "Back to List" link
  #  Then I should see the text "Export"
  #  Then I click the "Logout" link
  #  
  #  Then I login with "rdownie+jmediator@qamail1.rollstream.com"
  #  And I am on the issues home tab page
  #  And I click the "View" link
  #  And I click the "Back to List" link
  #  Then I should see the text "View by Due Date"
  

