# Feature: This might have to be mostly manual
#   
# Scenario: Number Formula Field for Companies 
# Scenario: Number Formula Field for Contacts
# Scenario: Number Formula Field for Registration
# Scenario: Number Formula Field for Companies TABULAR 
# Scenario: Number Formula Field for Contacts TABULAR
# Scenario: Number Formula Field for Registration TABULAR
# 
# Scenario: Date Formula Field for Companies  
# FIELD[Date1(9913)] + 3


# if (FIELD[Date1(9913)] > 2010-11-22 )
# "12/25/2010"
# else
# "01/01/2000"
# end


# True/False formula
# if (FIELD[Date1(9913)] > 2010-11-22 )
# true
# else
# false
# end

#Text Formula - needs a space
# if (FIELD[Nunber2(9901)] == 4 )
#  "pass"
# else
#  "fail"
# end

# Scenario: Date Formula Field for Contacts
# Scenario: Date Formula Field for Registration
# Scenario: Date Formula Field for Companies TABULAR 
# Scenario: Date Formula Field for Contacts TABULAR
# Scenario: Date Formula Field for Registration TABULAR
# 
# Scenario: Text Formula Field for Companies  
# TextArea
# DropList
# Scenario: Text Formula Field for Contacts
# Scenario: Text Formula Field for Registration
# Scenario: Text Formula Field for Companies TABULAR 
# Scenario: Text Formula Field for Contacts TABULAR
# Scenario: Text Formula Field for Registration TABULAR






# Feature:Custom Field Group: Overall Performance  FOR COMPANIES AND CONTACTS
# 
# Scenario: Overall_Rating (calculated_field) with following logic
#   *PASS* (if(overall_points>0.94,excellent)elseif(overall_points>0.89,good)elseif(overall_points>0.84,satisfactory),elseif(overall_points>0.79,poor)else0)
#   *PASS* Overall_Points = (Quality_Points) + (Delivery_Points) + (Responsiveness_Points)
#   *PASS* Quality_Rating (calculated_field) = (Quality_Points)/45
#   *PASS* Delivery_Rating (calculated_field) = (Delivery_Points)/45
#   *PASS* Responsiveness_Rating (calculated_field) = (Responsiveness_Points)/10 
# 
# Scenario: Custom Field Group: Quality 
#   Given Number_Quality_Issues (number_field)
#   Given NCR_Score = (calculated_custom_field) with the following calculation logic 
#  (if(number_quality_issues=0,15)elseif(number_quality_issues=1,12)elseif(number_quality_issues=2,9)elseif(number_quality_issues=3,6)elseif(number_quality_issues=4,3)else0) 
#   Given Number_Repeat_Quality_Issues (number_field) 
#   Given Scar_Score (calculated_custom_field) with the following calculation logic
#   Given (if(number_repest_quality_issues=0,30)elseif(number_repeat_quality_issues=2,10)elseif(number_repeat_quality_issuess=3,0)else0) 
#   Given Quality_Points = (calculated_field) = (NCR_Score) + (Scar_Score) 
# 
# Scenario: Custom Field Group:  Delivery
#   Given Total_Receipts (number_field)
#   Given OnTime_Infull (number_field)
#   Given Percent_OnTime (calculated field) = total_receipts / ontime_infull
#   Given Delivery Points (calculated field) = (if(percent_ontime>0.94,45)elseif(percent_ontime>0.89,40)elseif(percent_ontime>0.84,30),elseif(percent_ontime>0.79,10)else0)
#   