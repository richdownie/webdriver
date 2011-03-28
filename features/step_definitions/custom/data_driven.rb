Given /I create new issues/ do
  5000.times do
    @browser.goto("https://qaauto.rollstream.com/issues/new")
    @browser.select_list(:index, 1).select("PING")
    @browser.text_field(:index, 1).set(rand(999999).to_s)
    @browser.text_field(:index, 4).set("NONE")
    @browser.button(:value, "Save").click
  end
end