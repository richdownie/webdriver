Given /I add a new Workspace/ do
  @browser.div(:class, "new_ui_blue_button_inner").click
  @browser.text_field(:id, "workspace_name").set(@random + "New WS")
  @browser.div(:class, "new_ui_blue_button_inner").click
end