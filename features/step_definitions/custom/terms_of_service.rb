Given /I reset terms of service/ do
   @browser.goto(@community_url + "hacks/reset_terms_of_accepted")
end

Given /I update the terms of use/ do
  @browser.goto(@community_url + "hacks/update_terms")
end

Given /I delete the terms of use/ do
  @browser.goto(@community_url + "hacks/delete_terms")
end

Given /I click broker link with index of "(.*)"/ do |number|
  @browser.div(:class, 'new_ui_content').link(:index, number).click
end