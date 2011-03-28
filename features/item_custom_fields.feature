Feature:  Item Custom Fields
  In order to add custom fields to Items
  A web user
  visits the items custom fields page

@set4  
Scenario Outline:  Add Each Type Of Custom Fields  
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Items data
  And I am on the item custom fields page
  # * I click the "Manage Custom Fields" link
  And I click the <value> link
  And I fill in the text field "question_label" with <name>
  And I click the "SAVE" link
  
  Examples:
  | value              | name                   |
  | "Date"             | "Item Date"            |
  | "Drop List"        | "Item Drop List"       |
  | "Multiple Choice"  | "Item Multiple Choice" |
  | "File Upload"      | "Item File Upload"     |
  | "Text"             | "Item Text Field"      |
  | "Number"           | "Item Number"          |

@set4
Scenario Outline:  Edit Custom Field Values
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Items data
  And I am on the item custom fields page
  # * I click the "Manage Custom Fields" link
  And I click the <value> link
  And I fill in the text field "question_label" with <name>
  And I click the "SAVE" link
  And I am on the items page
  And I click the "1" link
  And I click the "Edit" link
  
  Examples:
  | value              | name                   | 
  | "Text"             | "Item Text Field"      |
  | "Number"           | "Item Number"          |

@firefox
Scenario:  Add new from companies page
  * I login with "rdownie@qamail1.rollstream.com"
  * I reset the Items data
  * I am on the item custom fields page
  # * I click the "Manage Custom Fields" link
  * I click the "Number" link
  * I wait for "2" seconds
  * I fill in the text field "question_label" with "Item Number"
  * I click the "SAVE" link
  * I am on the companies page
  * I click the "A&P" link
  * I click the "ITEMS" div
  * I click the "Manage Items" link
  * I click the "Add Item" link
  * I fill in the text field "item_name" with "CF Test Item"
  * I fill in the text field "item_form_response_attributes_answers_attributes_0_value" with "NonNumber"
  * I click the "SAVE" button
  * I should see the text "is not a number"
  * I fill in the text field "item_form_response_attributes_answers_attributes_0_value" with "44"
  * I click the "SAVE" button
  * I should see the text "successfully"
    
@firefox
Scenario:  Add new from mycompanies page
  * I login with "rdownie@qamail1.rollstream.com"
  * I reset the Items data
  * I am on the item custom fields page
  # * I click the "Manage Custom Fields" link
  * I click the "Number" link
  * I fill in the text field "question_label" with "Item Number"
  * I click the "SAVE" link
  * I am on the my company page
  * I click the "ITEMS" div
  * I click the "Manage Items" link
  * I click the "Add Item" link
  * I fill in the text field "item_name" with "CF Test Item"
  * I fill in the text field "item_form_response_attributes_answers_attributes_0_value" with "NonNumber"
  * I click the "SAVE" button
  * I should see the text "is not a number"
  * I fill in the text field "item_form_response_attributes_answers_attributes_0_value" with "44"
  * I click the "SAVE" button
  * I should see the text "successfully"


Scenario:  Import Custom Fields
Scenario:  Export Custom Fields