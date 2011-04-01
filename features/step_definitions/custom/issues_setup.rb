Given /I setup the issue type/ do
  steps %Q{
    Given I am on the issue types Admin page
    And I click the "Shipping Dispute" link
    And I click the "Issue Custom Fields" link
    And I click the "Manage Custom Fields" link
    And I click the "Text" link
    And I fill in the text field "question_label" with "Form Question?"
    And I click the "SAVE" link
    Given I am on the issue types Admin page
    And I click the "Shipping Dispute" link
    And I click the "Line Item Custom Fields" link
    And I click the "Manage Custom Fields" link
    And I click the "Text" link
    And I fill in the text field "question_label" with "Line Item Question?"
    And I click the "SAVE" link
  }
end

Given /I add an issue with company "(.*)" with color "(.*)"/ do |company, color|
  steps %Q{
    Given I am on the new issues page
    And I select "#{company}" from "issue_responder_id"
    And I fill in the text field "issue_form_response_attributes_answers_attributes_0_value" with "#{color}"
    And I fill in the text field "issue_line_items_attributes_0_form_response_attributes_answers_attributes_0_value" with "Black"
    And I fill in the text field "issue_line_items_attributes_0_due_date" with "01/01/2020"
    And I click the "SAVE" button
  }
end
    