@firefox
Feature: Items Feature

Background: 
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Items data

Scenario: Edit an Item
  And I click the "1" link
  And I click the "Edit" link
  And I fill in the text field "item_name" with "UPDATEd Item Name"
  And I fill in the text field "item_lot_number" with "11111"
  And I fill in the text field "item_code" with "22222"
  And I fill in the text field "item_description" with "Blah, Blah, Blah"
  And I fill in the text field "item_notes" with "Added Notes"
  And I click the "UPDATE" button
  And I click the "Logout" link

Scenario: Create a new Item at the Hub
  Given I am inside the Hub Company
  And I click the "ITEMS" div
  And I wait for "3" seconds
  # And I click the "Manage Items" link
  And I click the "Add Item" link
  And I fill in the text field "item_name" with "TestItem"
  And I click the "SAVE" button
  And I click the "Logout" link

Scenario: Upload a file to an existing Item
  And I click the "1" link
  And I click the "Edit" link
  And I upload "Companies.csv" to the "item_attachment" file field
  And I click the "UPDATE" button
  And I click the "Logout" link

Scenario: Upload a file to a new Item
  And I click the "1" link
  And I click the "Edit" link
  And I fill in the text field "item_name" with "UPDATEd Item Name"
  And I upload "Companies.csv" to the "item_attachment" file field
  And I click the "UPDATE" button
  And I click the "Logout" link

Scenario: Advanced Search
  And I click the "Advanced" link
  And I click the "search_code" checkbox
  And I fill in the text field "search_for_code" with "44Cuse"
  And I wait for "3" seconds
  And I click the "primary" link
  And I wait for "3" seconds
  Then I should see the text "Item Name"
  And I wait for "3" seconds
  Then I should NOT see the exact text "Item with url"
  And I wait for "3" seconds
  And I click the "Simple" link
  And I click the "Logout" link

Scenario: Invalid Item Save
  Given I am inside the Hub Company
  And I wait for "3" seconds
  And I click the "ITEMS" div
  And I wait for "3" seconds
  # And I click the "Manage Items" link
  And I click the "Add Item" link
  And I wait for "3" seconds
  And I click the "SAVE" button
  And I wait for "3" seconds
  Then I should see the text "can't be blank"
  And I click the "Logout" link

Scenario: Link an Item to google.com
  Given I am inside the Hub Company
  And I click the "ITEMS" div
  # And I click the "Manage Items" link
  And I click the "Add Item" link
  And I fill in the text field "item_name" with "TestItem"
  And I click the "Or click here to link to an existing document" link
  And I fill in the text field "item_document_url" with "http://www.google.com"
  And I click the "SAVE" button
  And I click the "Logout" link

Scenario: Import Items valid csv
  And I am on the companies page
  And I click the "A&P" link
  And I click the "ITEMS" div
  # And I click the "Manage Items" link
  And I click the "Import Items" link
  And I upload "item_import.csv" to the "import_uploaded_data" file field
  And I wait for "3" seconds
  And I click the "Next" link
  And I wait for "3" seconds
  And I click the "Next" link
  And I wait for "3" seconds
  And I click the "Next" link
  And I wait for "3" seconds
  And I click the "Go to Items." link
  And I click the "Logout" link

Scenario: Import Items invalid csv duplicate item_id
  And I am on the companies page
  And I click the "A&P" link
  And I click the "ITEMS" div
  # And I click the "Manage Items" link
  And I click the "Import Items" link
  And I upload "invalid_item_import.csv" to the "import_uploaded_data" file field
  And I wait for "3" seconds
  And I click the "Next" link
  And I wait for "3" seconds
  And I click the "Next" link
  And I wait for "3" seconds
  Then I should see the text "1 invalid row found"
  And I click the "Logout" link

Scenario: Import Items from Items List
  And I am on the items page
  # And I click the "Manage Items" link
  And I click the "Import Items" link
  And I upload "no_company_item_import.csv" to the "import_uploaded_data" file field
  And I wait for "3" seconds
  And I click the "Next" link
  And I wait for "3" seconds
  And I click the "Next" link
  And I wait for "3" seconds
  And I click the "Next" link
  And I wait for "3" seconds
  And I click the "Go to Items." link
  And I am on the companies page
  And I wait for "3" seconds
  And I fill in the text field "quick_search" with "ping"
  And I click the "Search" link
  And I wait for "3" seconds
  And I click the "PING" link
  And I click the "ITEMS" div
  Then I should see the text "TestRich"
  And I click the "Logout" link

Scenario: Add Multiple Documents to Item
  And I am on the items page
  And I click the "1" link
  And I click the "Edit" link
  And I upload "no_company_item_import.csv" to the "item_attachment" file field
  And I click the "item_submit" button
  And I click the "Edit" link
  And I upload "no_company_item_import.csv" to the "item_attachment" file field
  And I click the "Upload another document" link
  And I upload "no_company_item_import.csv" to the "item_attachment" file field
  And I click the "item_submit" button

Scenario: Export Items
  And I am on the items page
  # And I click the "Manage Items" link
  And I click the "Export Items" link
  And I am on the my company page
  And I click the "ITEMS" div
  # And I click the "Manage Items" link
  And I click the "Export Items" link
  And I am on the companies page
  And I click the "A&P" link
  And I click the "ITEMS" div
  # And I click the "Manage Items" link
  And I click the "Add Item" link
  And I fill in the text field "item_name" with "Sample1"
  And I click the "item_submit" button
  # And I click the "Manage Items" link
  And I click the "Export Items" link
  
Scenario: Delete an Item
  And I am on the items page
  And I click the "1" link
  And I click the "Delete" link
  And I wait for "3" seconds
  And I click the "primary" link

