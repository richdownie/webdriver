@wip
Feature: O&M Import

Scenario: Setup
  Given I login with "rdownie@qamail1.rollstream.com"
  And I reset the Issues data


Scenario Outline: Add Owens & Minor Form Fields
  And I am on the Issues page
  And I click the "ADMIN" div
  And I click the "Shipping Dispute" link
  And I click the "Text Field" under "issue_links"
  And I fill in the text field "1" with <form_name>
  And I click the "Add Field" button

  Examples:
    | form_name        |
    | "FormNumber"     |
    | "CreateDate"     |
    | "UserID"     |
    | "SupplierContactName"     |
    | "SupplierPhone"     |
    | "SupplierFax"     |
    | "SupplierEmail"     |
    | "SupplierBackupContact"     |
    | "SupplierNumber"     |
    | "AccountNumber"     |
    | "SupplierDCLocation"     |
    | "CustOrderNumber"     |
    | "BillOfLadingNumber"     |
    | "PRONumber"     |
    | "ShipDate"     |
    | "OMContactName"     |
    | "OMPhone"     |
    | "OMFax"     |
    | "OMEmail"     |
    | "DCNumber"     |
    | "DCName"     |
    | "DCAddress"     |
    | "DCCityState"     |
    | "NoPackagingSlipBillOfLading"     |
    | "ProductDamaged"     |
    | "PalletInPoorCondition"     |
    | "ShrinkWrapBroken"     |
    | "DifficultyReceivingPallets"     |
    | "ShrinkWrapQuality"     |
    | "MerchandiseShortage"     |
    | "MerchandiseOverage"     |
    | "DamagedRefused"     |
    | "Other"     |
    | "Other1"     |
    | "Explanation"     |
    | "Resolution"     |
    | "SupplierRGANumber"     |
    | "SupplierReferenceNumber"     |
    | "ReturnToAddress"     |
    | "RestockFee"     |
    | "Other2"     |

Scenario Outline: Add Owens & Minor Line Item Fields
  And I am on the Issues page
  And I click the "ADMIN" div
  And I click the "Shipping Dispute" link
  And I click the "Text Field" under "line_item_links"
  And I fill in the text field "1" with <line_item_name>
  And I click the "Add Field" button
  
  Examples:
    | line_item_name        |
    | "ItemCode"     |
    | "Qty"     |
    | "UOM"     |
    | "Type"     |
    | "Comments"     |
    
Scenario: Upload OM .csv
    Given I login with "rdownie+hcreator@qamail1.rollstream.com"
    And I am on the issues page
    And I click the "MANAGE LINE ITEMS" div
    And I click the "Import" link
    And I wait for "5" seconds
    And I upload "owens_minor_daily_disputes.csv" to the "import_uploaded_data" file field
    And I click the "Next" link
  	And I wait for "6" seconds
    And I click the "Next" link
  	And I wait for "6" seconds
    And I click the "Next" link
  	And I wait for "6" seconds
    And I click the "Next" link
  	And I wait for "12" seconds
  	And I click the "next-step" div
    # And I click the "Finish" link
    And I click the "Logout" link
  