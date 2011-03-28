Given /I check my messages/ do
  if @browser.contains_text("no messages") then
     @browser.div(:class, "new_ui_system_button_inner").click
     @browser.contains_text("Message has been archived")
  else   
    @browser.link(:text, "1 message").click
    @browser.link(:text, /View/).click
  end
end