Then /^I should verify that all files were successfully uploaded$/ do |file_table|
  file_table.hashes.each do |hash|
    #hash.symbolize_keys
    steps %Q{
      Given I go to the profile page for company "#{hash[:id]}"
      And I click the "NON-TABULAR" link
      Then I should see the text "#{hash[:company_id]}-Test"
    }
  end
end
      
  