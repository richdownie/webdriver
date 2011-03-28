# require 'win32ole'
# 
# 
# class Popups
#   
#   def test_ok_button
#     sleep 3
#     $browser.button(:id, /delete_button/).click
#     puts "Clicked Delete Button"
#   end  
#   
#   def test_ie_ok_button
#     begin
#        @autoit = WIN32OLE.new('AutoItX3.Control')
#        @autoit.WinWaitActive("Windows Internet Explorer")
#        @autoit.Send "{ENTER}"
#        sleep(5)
# 
#      rescue Exception => e
#        puts e
#      end
#    end
# end
# World(Popups)