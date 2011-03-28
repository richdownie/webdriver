Given /The Issues Save Search Name gets saved with "(.*)"/ do |what|
  @browser.div(:id, 'default_dialog').text_field(:index, "1").set(what)
end

Given /The Line Item Save Search Name gets saved with "(.*)"/ do |what|
  @browser.div(:id, 'default_dialog').text_field(:index, "1").set(what)
end

Given /I click the Edit Link Text Column for Issues/ do
  @browser.table(:id, 'issue_form_columns').link(:text, 'Edit').click
end

Given /I click the Edit Link Text Column for Line Items/ do
  @browser.table(:id, 'line_item_form_columns').link(:text, 'Edit').click
end

Given /I click the Drop-List Field under Fields for Line Items/ do
  @browser.ul(:id, 'line_item_links').link(:text, 'Drop-List Field').click
end

Given /I click the Number Field under Fields for Line Items/ do
  @browser.ul(:id, 'line_item_links').link(:text, 'Number Field').click
end

Given /I click the "(.*)" under "(.*)"/ do |link, where|
  @browser.ul(:id, where).link(:text, link).click
end

Given /^I set checkbox "(.*)" in the search results$/ do |index|
  @browser.div(:class, "issues-content").checkbox(:index, index).click
end

Given /I verify Earmark Table Row exists/i do
  assert(@browser.table(:class => "result-list issues scrollable").row(:class => ' near_due').exists?)
end

Given /I verify Earmark Table Row does NOT exist/i do
  assert(@browser.table(:class => "result-list issues scrollable").row(:class => ' near_due').exists? == false)
end

Given /I verify Earmark displays on Show page/i do
  assert(@browser.li(:class => 'near_due alt').exists?)
end

Given /I verify Earmark does NOT display on Show page/i do
  assert(@browser.li(:class => 'near_due').exists? == false)
end

Then /^I make sure Search criteria is displayed$/ do
  if @browser.link(:text, 'Search').exists? then
    @browser.link(:text, 'Search').click
  end
end

Then /^I click "(.*)" link in "(.*)"$/ do |index, div|
  @browser.div(:class, div).link(:index, index).click
end