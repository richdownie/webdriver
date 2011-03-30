Given /I check for the header and footer/ do
  assert(@browser.div(:class, /links/).exists?)
  text = ["Logout", "Support", "Help"]
  text.collect { |text| assert(@browser.text) }
  assert(@browser.div(:class, /footer/).exists?)
  assert(@browser.image(:src, /logo.png/).exists?)
end