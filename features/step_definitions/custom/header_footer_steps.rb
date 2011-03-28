Given /I check for the header and footer/ do
  #header
  assert(@browser.div(:class, /links/).exists?)
  # text = "Logout"
  assert(@browser.contains_text("Logout"))
  # text = "Support"
  assert(@browser.contains_text("Support"))
  # text = "Help"
  assert(@browser.contains_text("Help"))
  assert(@browser.image(:src, /logo/).exists?)
  #footer
  assert(@browser.div(:class, /footer/).exists?)
  assert(@browser.image(:src, /footer_rs_logo-black.png/).exists?)
end