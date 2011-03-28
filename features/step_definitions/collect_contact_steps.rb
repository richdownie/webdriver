Given /I fill in the collect contacts email field/ do
  @browser.text_field(:id => 'person_email').set("rdownie+kj@qamail1.rollstream.com")
end