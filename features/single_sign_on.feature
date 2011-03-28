Feature: Single Sign On
  
  In order to seamlessly access RollStream
  As a user of an external system
  I want to be authenticated to RollStream when already authenticated on a trusted, external system

  Background:
    Given I login with "rdownie@qamail1.rollstream.com"
    And I reset the SSO users data
    And I click the "Logout" link
    And I am on the hacks sso page
	
  Scenario Outline: Try to invoke SSO without specifying required parameters
   	Given I fill in the text field "sso_url" with <sso_url>
    And I fill in the text field "source" with <sso_source>
    And I fill in the text field "secret" with <sso_secret>
    And I fill in the text field "email" with <email>
    When I submit the form "sso_form"
    Then I should see the text <text>
    
    Examples:
    | sso_url                                            | sso_source     | sso_secret                                 | email                            | text                     |  |
    | ""                                                 | ""             | ""                                         | ""                               | "Community Login"        |  |
    | ""                                                 | "Watir Source" | "fbda61f6dd71227e210599789e51e3019be893eb" | "rdownie@qamail1.rollstream.com" | "Community Login"        |  |
    | "https://qaauto.rollstream.com/authentication/sso" | ""             | "fbda61f6dd71227e210599789e51e3019be893eb" | "rdownie@qamail1.rollstream.com" | "Invalid login request." |  |
    | "https://qaauto.rollstream.com/authentication/sso" | "Watir Source" | ""                                         | "rdownie@qamail1.rollstream.com" | "Invalid login request." |  |
    | "https://qaauto.rollstream.com/authentication/sso" | "bogus"        | "fbda61f6dd71227e210599789e51e3019be893eb" | "rdownie@qamail1.rollstream.com" | "Invalid login request." |  |
    | "https://qaauto.rollstream.com/authentication/sso" | "Watir Source" | "adsfqwer3dffadsf"                         | "rdownie@qamail1.rollstream.com" | "Invalid login request." |  |
	
  Scenario Outline: Access various pages as an existing user
    Given I set the main sso fields
    And I fill in the text field "email" with <email>
    And I fill in the text field "destination" with <destination>
    And I fill in the text field "on_error" with <on_error>
    And I fill in the text field "on_logout" with <on_logout>
    When I submit the form "sso_form"
    Then I should see the text <text>
    And I click the "Logout" link

    Examples:
    | email                            | destination  | on_error | on_logout | text                      |
    | "rdownie@qamail1.rollstream.com" | ""           | ""       | ""        | "Home » Dashboard"        |
    | "rdownie@qamail1.rollstream.com" | "/companies" | ""       | ""        | "All Companies"           |
    | "rDowNIe@QAmaIl1.RollSTReam.Com" | "/people"    | ""       | ""        | "Contacts » All Contacts" |
   
 

  Scenario Outline: Access various pages as an existing user, exception cases
    Given I set the main sso fields
    And I fill in the text field "email" with <email>
	  And I fill in the text field "destination" with <destination>
	  And I fill in the text field "on_error" with <on_error>
	  And I fill in the text field "on_logout" with <on_logout>
	  When I submit the form "sso_form"
	  Then I should see the text <text>
      And I should see the div <div>
	
	Examples:
    | email                                 | destination    | on_error                 | on_logout | text                         | div                          |
    | "SBOURdEaU+Hg@QAMAIL1.rollsTream.coM" | "/workspaces"  | ""                       | ""        | "You do not have permission" | ""                           |
    | "SBOURdEaU+Hg@QAMAIL1.rollsTream.coM" | "/communities" | ""                       | ""        | ""                           | "You do not have permission" |
    | ""                                    | ""             | "http://rudyonrails.com" | ""        | "Rudy.rhetoric"              | ""                           |
  

  Scenario Outline: Access the various pages as a non-existing user
    Given I set the main sso fields
    And I fill in the text field "email" with <email>
    And I fill in the text field "first_name" with <first_name>
    And I fill in the text field "last_name" with <last_name>
    And I fill in the text field "destination" with <destination>
    And I fill in the text field "company_id" with <company_id>
	And I fill in the text field "on_error" with <on_error>
    And I fill in the text field "on_logout" with <on_logout>
    When I submit the form "sso_form"
	Then I should see the text <text>
    And I should see the div <div>
    And I click the "Logout" link

	Examples:
    | email                         | first_name | last_name | company_id   | destination   | on_error | on_logout | text               | div            |  |
    | "sherman.douglas@example.org" | "Sherman"  | "Douglas" | "taylormade" | ""            | ""       | ""        | "Home » Dashboard" | "AUTO"         |  |
    | "sherman.douglas@example.org" | "Sherman"  | "Douglas" | "taylormade" | "/my_profile" | ""       | ""        | "Home » Dashboard" | "EDIT PROFILE" |  |
    | "sgreen+jj@example.org"       | "Seth"     | "Green"   | "callaway"   | ""            | ""       | ""        | "Home » Dashboard" | "AUTO"         |  |

  Scenario Outline: Access the various pages as a non-existing user, exception cases
    Given I set the main sso fields
	And I fill in the text field "email" with <email>
	And I fill in the text field "first_name" with <first_name>
	And I fill in the text field "last_name" with <last_name>
	And I fill in the text field "destination" with <destination>
	And I fill in the text field "company_id" with <company_id>
	And I fill in the text field "on_error" with <on_error>
	And I fill in the text field "on_logout" with <on_logout>
	When I submit the form "sso_form"
	Then I should see the text <text>
	And I should see the div <div>

    Examples:
    | email                         | first_name | last_name | destination | company_id | on_error                 | on_logout | text                                       | div |  |
    | "david.pague+jj@example.info" | "David"    | "Pogue"   | ""          | ""         | "http://rudyonrails.com" | ""        | ""                                         | ""  |  |
    | ""                            | ""         | ""        | ""          | ""         | ""                       | ""        | "missing: email"                           | ""  |  |
    | "afasdf3aewr"                 | ""         | ""        | ""          | ""         | ""                       | ""        | "missing: first_name last_name company_id" | ""  |  |
    | "afasdf3aewr"                 | "Seth"     | ""        | ""          | ""         | ""                       | ""        | "missing: last_name company_id"            | ""  |  |
    | "afasdf3aewr"                 | "Seth"     | "Green"   | ""          | ""         | ""                       | ""        | "missing: company_id"                      | ""  |  |
    | "afasdf3aewr"                 | "Seth"     | "Green"   | ""          | "junkco"   | ""                       | ""        | "Invalid company ID junkco"                | ""  |  |
    | "afasdf3aewr"                 | "Seth"     | "Green"   | "/people"   | "callaway" | ""                       | ""        | "Email is not a valid email address"       | ""  |  |
    
	

	
	
    
    
    
    
    

      
    

      
    
