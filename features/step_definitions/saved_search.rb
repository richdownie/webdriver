Given /I enter "([^\"]*)" in the advanced search textfield/ do |text|
  @browser.div(:id, "advanced-search").text_field(:index, 1).set(text)
end