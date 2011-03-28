Given /"(.*)" should be able to "(.*)" a "(.*)" line item and see "(.*)"/ do |user, update, current, result |
  steps %Q{
    Given I login with "#{user}"
    And I am on the issues page
    And I click the "#{current}" link
    And I select "#{update}" from "bulkOperations"
    And I click the "enableAllCheckbox" checkbox
    And I click the "Update" link
    And I click the "Proceed With Update" button
    Then I should see the text "#{result}"
  }
end