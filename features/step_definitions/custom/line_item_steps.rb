Given /Under "(.*)" div I click "(.*)"/ do |div, text|
  @browser.div(:id, /div/).link(:text, text)
end

Given /Under "(.*)" div text field "(.*)" with "(.*)"/ do |div, id, text|
  @browser.div(:id, /div/).text_field(:id, id).set(text)
end