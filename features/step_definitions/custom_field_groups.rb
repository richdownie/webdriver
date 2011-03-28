Given /I make this field dependent on droplist/ do
  @browser.checkbox(:id, /question_enable_dependent/).set
end

Given /I choose "(.*)" from the "(.*)" droplist/ do |value, id|
  @browser.select_list(:id, /#{id}/).select(value)
end

Given /Done/ do
  @browser.button(:value, "Done").click
end

Given /I add a multiple choice/ do
  steps %Q{
    And I wait for "3" seconds
    And I select "Multiple Choice" from "field select medium"
    And I wait for "3" seconds
    And I click the "Next" button
    And I wait for "3" seconds
    And I fill in the text field "3" with "Multiple Choice Parent"
    And I wait for "3" seconds
    And I click the "Add Choice" button #ADD CHOICE
    And I wait for "3" seconds
    And I fill in the text field "6" with "one"
    And I wait for "3" seconds
    And I click the "Add Choice" button #ADD CHOICE
    And I wait for "3" seconds
    And I fill in the text field "9" with "two"
    And I wait for "3" seconds
    And I click the "Add Choice" button #ADD CHOICE
    And I wait for "3" seconds
    And I fill in the text field "12" with "three"
    And I click the "4" button #DONE
    And I wait for "3" seconds
  }
end

Given /I add a "(.*)" field dependent on multiple choice/ do |type|
  steps %Q{
  And I wait for "3" seconds
  And I select "#{type}" from "field select medium"
  And I wait for "3" seconds
  And I click the "Next" button
  And I wait for "3" seconds
  And I fill in the text field "3" with "Dependent Field"
  And I wait for "3" seconds
  And I make this field dependent on droplist
  And I wait for "1" seconds
  And I choose "Multiple Choice Parent" from the "choose_dependent_question" droplist
  And I choose "two" from the "choose_dependent_question_answer" droplist
  And I choose "three" from the "choose_dependent_question_answer" droplist
  And I click the "2" radio button
  And I wait for "2" seconds
  And I click the "2" button #DONE
  And I wait for "5" seconds
  }
end

Given /I add a droplist/ do
  steps %Q{
    And I wait for "3" seconds
    And I select "Drop List" from "field select medium"
    And I wait for "3" seconds
    And I click the "Next" button
    And I wait for "3" seconds
    And I fill in the text field "3" with "Drop List Parent"
    And I wait for "3" seconds
    And I click the "Add Choice" button #ADD CHOICE
    And I wait for "3" seconds
    And I fill in the text field "6" with "one"
    And I wait for "3" seconds
    And I click the "Add Choice" button #ADD CHOICE
    And I wait for "3" seconds
    And I fill in the text field "9" with "two"
    And I wait for "3" seconds
    And I click the "Add Choice" button #ADD CHOICE
    And I wait for "3" seconds
    And I fill in the text field "12" with "three"
    And I click the "4" button #DONE
    And I wait for "3" seconds
  }
end

Given /I add a "(.*)" field dependent on droplist/ do |type|
  steps %Q{
  And I wait for "3" seconds
  And I select "#{type}" from "2"
  And I wait for "3" seconds
  And I click the "Next" button
  And I wait for "3" seconds
  And I fill in the text field "3" with "Dependent Field"
  And I wait for "3" seconds
  And I make this field dependent on droplist
  And I wait for "1" seconds
  And I choose "Drop List Parent" from the "choose_dependent_question" droplist
  And I choose "two" from the "choose_dependent_question_answer" droplist
  And I choose "three" from the "choose_dependent_question_answer" droplist
  And I wait for "2" seconds
  And I click the "2" button #DONE
  And I wait for "5" seconds
  }
end