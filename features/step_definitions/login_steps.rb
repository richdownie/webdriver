Given /I login with "(.*)"/ do |email|
  @browser.goto(@account_service_url)
  @browser.text_field(:id, 'login').set(email)
  @browser.text_field(:id, 'password').set("testing1")
  @browser.form(:id, 'login_form').submit
  @browser.link(:text, /#{@login_at}/i).click unless @browser.link(:text, /#{@login_at}/i).exists? == false
end
  
Given /I am not logged in/ do
  @browser.goto(@account_service_url)
end

Given /^I verified that I am logged in$/ do
  @browser.goto("https://qaadmin.rollstream.com/sessions/create?login=rdownie&password=testing1")
end

Given /^I close the browser$/ do
  @browser.close
end