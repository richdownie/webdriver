require 'logger'
require 'cucumber'
require 'broach'
require 'ruby-debug'
# Comment out the next line if you don't want Cucumber Unicode support
require 'cucumber/formatter/unicode'
require 'test/unit/assertions'
include Test::Unit::Assertions

require 'watir-webdriver'
browser = Watir::Browser.new :firefox

 
# if ENV['SAFARIWATIR']
#   require 'safariwatir'
#   Browser = Watir::Safari
#   browser = Browser.new
# elsif ENV['FIREWATIR']
#     require 'firewatir'
#     Browser = FireWatir::Firefox
#     browser = Browser.new
# elsif ENV['CHROMEWATIR']
#   require 'chrome_watir'
#   Browser = ChromeWatir::Browser
#   browser = Browser.new
# else
#   case RUBY_PLATFORM
#   when /darwin/
#     require 'firewatir'
#     Browser = FireWatir::Firefox
#     browser = Browser.new
#   when /win32|mingw/
#     require 'watir'
#     require 'win32ole'
#     Browser = Watir::IE
#     browser = Browser.new
#     browser.speed = :fast
#   when /java/
#     require 'celerity'
#     Browser = Celerity::Browser
#     browser = Browser.new
#   else
#     raise "This platform is not supported (#{PLATFORM})"
#   end
# end

Before do
  @browser = browser
  @random = rand(9999999).to_s
  @autometrics = "http://autometrics.heroku.com"
  @today = Time.now.strftime("%m/%d/%Y")
    
  @login_at = "hoyas"
  @account_service_url = "https://qaaccount.rollstream.com/"
  @community_url = "https://qahoyas.rollstream.com/"
  # @anonymous_reg = "anonymous_user_request/11/3334de0ca876c420768e28754d9d6cf696b81abe"  #AUTO
  @anonymous_reg = "anonymous_user_request/11/2d75f8156472e7e55544caebb6ab70a8e3e31993"   #hoyas

  # @account_service_url = "https://stgaccount.rollstream.com/"
  # @community_url = "https://stgaztec.rollstream.com/"
  # @anonymous_reg = "anonymous_user_request/11/5d6802cf145632cdd6bc36654903f71e4f423caf"

  @sso_url = @community_url + "authentication/sso"
  @sso_source = "MySystem"
  @sso_secret = "74421ea5268fc9a494f3ca69335754c831e9d064"
  # @community_url = "http://localhost:3000/"
end


# @autometrics = "http://autometrics.heroku.com"
# After do |scenario|
#   if(scenario.failed?)
#     @browser.goto(@autometrics + "/home/dump?push=#{scenario.backtrace_line}")
#   end
# end
# 
# at_exit do  
#   Broach.settings = { 'account' => 'rollstream', 'token' => 'cc31a48b6261fc8263d83d115ae212cd5bd5166b' }
#  # Broach.speak('Experiment Room', "Browser: " + "#{browser}")
#   Broach.speak('Experiment Room', "Total Run Time " + "#{Time.now.to_i - start_time}" + " seconds")
#   # Broach.speak('Experiment Room', "*******************************************************************************************") 
#   
#   case hour
#       when 1
#         Broach.speak('Experiment Room', "Set1")
#       when 2
#         Broach.speak('Experiment Room', "Set2")  
#       when 3
#         Broach.speak('Experiment Room', "Set3")
#       when 4
#         Broach.speak('Experiment Room', "Set4")
#       when 5
#         Broach.speak('Experiment Room', "Set5")
#       when 6
#         Broach.speak('Experiment Room', "Set6")
#       when 7
#         Broach.speak('Experiment Room', "Set1")
#       when 8
#         Broach.speak('Experiment Room', "Set2")
#       when 9
#         Broach.speak('Experiment Room', "Set3")
#       when 10
#         Broach.speak('Experiment Room', "Set4")
#       when 11
#         Broach.speak('Experiment Room', "Set5")
#       when 12
#         Broach.speak('Experiment Room', "Set6")      
#       when 13
#         Broach.speak('Experiment Room', "Set1")
#       when 14
#         Broach.speak('Experiment Room', "Set2")  
#       when 15
#         Broach.speak('Experiment Room', "Set3")
#       when 16
#         Broach.speak('Experiment Room', "Set4")
#       when 17
#         Broach.speak('Experiment Room', "Set5")
#       when 18
#         Broach.speak('Experiment Room', "Set6")
#       when 19
#         Broach.speak('Experiment Room', "Set1")
#       when 20
#         Broach.speak('Experiment Room', "Set2")
#       when 21
#         Broach.speak('Experiment Room', "Set3")
#       when 22
#         Broach.speak('Experiment Room', "Set4")
#       when 23
#         Broach.speak('Experiment Room', "Set5")
#       when 24
#         Broach.speak('Experiment Room', "Set6")
#   end
# end
