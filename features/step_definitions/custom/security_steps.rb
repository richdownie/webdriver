Given /I set perms for role with "(.*)"/ do |value|
  @browser.goto(@community_url + "hacks/setup_community_permissions?set_perm=#{value}")
end

Given /I destroy existing perms/ do
  @browser.goto(@community_url + "hacks/destroy_community_permissions")
end