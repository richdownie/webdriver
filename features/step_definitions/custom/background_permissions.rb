Given /I verify all checkboxes are unchecked/ do
  checkboxes = @browser.checkboxes
  checkboxes.map { |checkbox| if checkbox.enabled? then checkbox.clear end }
end

Given /I verify all checkboxes are checked/ do
  checkboxes = @browser.checkboxes
  checkboxes.map { |checkbox| if checkbox.enabled? then checkbox.set end }
end