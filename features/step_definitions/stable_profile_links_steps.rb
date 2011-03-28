  Given /I go to the stable link for company "(.*)"/ do |company_id|
  @browser.goto(@community_url + "link/company/" + company_id)
end

Given /I go to the stable parameters link for company "(.*)"/ do |company_id|
  @browser.goto(@community_url + "link/company?company_id=" + company_id)
end

Given /I should see the div "(.*)"/ do |name|
  assert(@browser.div(:text, /#{name}/).exists?)
end

Given /I go to the stable company contacts link for "(.*)"/ do |company_id|
  @browser.goto(@community_url + "link/company/" + company_id + "/contacts")
end

Given /I go to the stable parameters company contacts link for "(.*)"/ do |company_id|
  @browser.goto(@community_url + "link/company?company_id=" + company_id + "&destination=contacts")
end

Given /I go to the stable company divisions link for "(.*)"/ do |company_id|
  @browser.goto(@community_url + "link/company/" + company_id + "/divisions")
end

Given /I go to the stable parameters company divisions link for "(.*)"/ do |company_id|
  @browser.goto(@community_url + "link/company?company_id=" + company_id + "&destination=divisions")
end
  
Given /I go to the stable contact link for "(.*)"/ do |email_address|
  @browser.goto(@community_url + "link/contact/" + email_address)
end

Given /I go to the stable parameters contact link for "(.*)"/ do |email_address|
  @browser.goto(@community_url + "link/contact?email=" + email_address)
end

Given /I go to the stable contact link with company for "(.*)" in "(.*)"/ do |email_address, company_id|
  @browser.goto(@community_url + "link/contact/" + company_id + "/" + email_address)
end

Given /I go to the stable parameters contact link with company for "(.*)" in "(.*)"/ do |email_address, company_id|
  @browser.goto(@community_url + "link/contact?company_id=" + company_id + "&email=" + email_address)
end