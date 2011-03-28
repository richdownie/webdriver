Given /I add a new poll/ do
  @browser.link(:text, "New Poll").click
  @browser.text_field(:id, "workspace_poll_title").set("What is your favorite color?")
  @browser.text_field(:id, "workspace_poll_description").set("Primary Colors")
  @browser.text_field(:id, "choice_1").set("Red")
  @browser.text_field(:id, "choice_2").set("Blue")
  @browser.button(:text, "New Choice").click
  @browser.text_field(:id, "choice_3").set("Yellow")
  @browser.button(:text, "Save").click
end