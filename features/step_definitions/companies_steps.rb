Given /^I am logged in as a community administrator$/ do
  pending
=begin
  Given %{I am on "the login page"}
  And %{I fill in "email" with "sbourdeau@qamail1.rollstream.com"}
  And %{I fill in "password" with "rollstream123"}
  #And %{I follow "Get Password"}
  And %{I follow "Wiley"}
=end
end

Then /^I should see certain elements$/ do
  assert(@browser.contains_text("ALL COMPANIES"))
  assert(@browser.contains_text("Companies"))
  assert(@browser.contains_text("Tags"))
  assert(@browser.div(:id, "export_report").exists?)
end

Given /I am inside the Hub Company/ do
  @browser.goto(@community_url + "organizations/1")
end

Given /^I go to the profile page for company "(.*)"$/ do |value|
  @browser.goto(@community_url + "organizations/" + "#{value}")
end

  