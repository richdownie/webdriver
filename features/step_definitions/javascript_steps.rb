Given /I hammer the ok js/ do
  @browser.click_jspopup_button("OK")
end

Given /I fire the group manage menu/ do
  @browser.li(:class, "js-dropdown").fire_event("onmouseover")
end

Given /I fire the company manage menu/ do
  @browser.li(:xpath, "/html/body/div[1]/div[4]/div[1]/div[4]/div[2]/div[1]/div/ul/li").fire_event("onmouseover")
end
