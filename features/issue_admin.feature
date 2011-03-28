@set4
Feature: General Issue Email Scenarios

Scenario Outline:  Implement cucumber stories for setting "from" and "reply-to" fields for issue emails
Given I login with "rdownie@qamail1.rollstream.com"
  And I am on the issue types Admin page
  And I wait for "2" seconds
  And I click the "Shipping Dispute" link
  And I click the "Basic Settings" link
  When I fill in the text field "issue_type_from" with <fromemail>
  And I fill in the text field "issue_type_reply_to" with <replytoemail>
  And I click the "save" button
  Then I should see the text <text>
  
  Examples:
  | fromemail | replytoemail | text |
  # Two valid email addreses
  | "sbourdeau+sifrom@qamail1.rollstream.com" | "sbourdeau+sireply@qamail1.rollstream.com" | "has been saved" |
  # Two valid .aero and .info email addresses. We've have problems with these before.
  | "sbourdeau+sifrom@qamail1.info" | "sbourdeau+sireply@qamail1.aero" | "has been saved" |
  # Invalid replytoemail
  | "sbourdeau+sifrom@qamail1.rollstream.com" | "fas;ljeqworiuafre" | "is not a valid email address" |
  # Invalid fromemail
  | "wqrdf349dafpjqrnf" | "sbourdeau+sireply@qamail1.rollstream.com" | "is not a valid email address" |
  # Invalid fromemail and replytoemail
  | "as;lfjas340589 radjf" | "23-1908dfn3u8dsafqwerwe" | "is not a valid email address" |
  # Invalid email with more than six characters for toplevel domain
  | "sbourdeau+sifrom@qamail1.morethansix" | "sbourdeau+sireply@qamail1.rollstream.com" | "is not a valid email address" |


Scenario Outline: A Community Administrator can configure aging settings per issue type
	Given I login with "rdownie@qamail1.rollstream.com"
  And I am on the issue types Admin page
  And I click the "Shipping Dispute" link
  And I click the "Basic Settings" link
  When I fill in the text field "issue_type_default_interval_due" with <duedateinterval>
  And I fill in the text field "issue_type_days_before_due" with <warninginterval>
  And I click the "save" button
  Then I should see the text <text>
  
  Examples:
  | duedateinterval | warninginterval | text              |
  # Two invalid values
  | "asfa"          | "231sfda"       | "is not a number" |
  # One invalid, one valid
  | "35"            | "dsafjas"       | "is not a number" |
  # One invalid, one valid
  | "a90jk"         | "14"            | "is not a number" |

  
