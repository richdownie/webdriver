Given /I remove the original email/ do
   @browser.goto(@community_url + "hacks/remove_original_email")
   @browser.back
   @browser.refresh
end

Given /I send the reminder message/ do
  t = @browser.table(:class, 'list')
  t.each do |cell|                    
    if cell.div(:class, /new_ui_blue_button_inner/).exists? 
      @browser.cell(:xpath, "//div[@class='new_ui_blue_button_inner']").click
    end
  end
end