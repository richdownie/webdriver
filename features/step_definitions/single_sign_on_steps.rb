Given /I set the main sso fields/ do
  steps %Q{
    Given I fill in the text field "sso_url" with "#{@sso_url}"
    Given I fill in the text field "source" with "#{@sso_source}"
    Given I fill in the text field "secret" with "#{@sso_secret}"
  }
end

