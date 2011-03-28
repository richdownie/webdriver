@set2
Feature: Stable Profile Links
  
  In order to quickly find information in Rollstream
  As a user of an external system
  I want stable links to company and contact pages
  
  Background:
	Given I login with "rdownie+employee@qamail1.rollstream.com"
  
  Scenario: Access the new registration page
    Given I am on the stable new registration page
    Then I should see the text "Request Company Registration"

  Scenario Outline: Access a company profile page
    Given I go to the stable link for company <company_id>
    Then I should see the text <text>
    And I should see the div <div>

    Examples:
    | company_id  | text                                                    | div              |
    | "NSC1234"   | "Company Directory » NASCAR » Details"                                      | "Edit Company"   |
    | "notrealco" | "I'm sorry, the page you requested could not be found." | "Page Not Found" |

  Scenario Outline: Access a company profile page with parameters
	Given I go to the stable parameters link for company <company_id>
	Then I should see the text <text>
	And I should see the div <div>

	Examples:
 | company_id  | text                                                    | div              |
 | "NSC1234"   | "Company Directory » NASCAR » Details"                                      | "Edit Company"   |
 | "notrealco" | "I'm sorry, the page you requested could not be found." | "Page Not Found" |
 | "13/4545"   | "Company Directory » Strange Characters in ID » Details"                   | "Edit Company"   |

  Scenario Outline: Access a company's contacts page
    Given I go to the stable company contacts link for <company_id>
    Then I should see the text <text>
    And I should see the div <div>

    Examples:
    | company_id  | text                                                    | div              |
    | "NSC1234"   | "NASCAR » Contacts"                                     | "ADD CONTACT"    |
    | "notrealco" | "I'm sorry, the page you requested could not be found." | "Page Not Found" |
    
  Scenario Outline: Access a company's contacts page with parameters
    Given I go to the stable parameters company contacts link for <company_id>
	Then I should see the text <text>
	And I should see the div <div>

	Examples:
 | company_id  | text                                                    | div              |
 | "NSC1234"   | "NASCAR » Contacts"                                     | "ADD CONTACT"    |
 | "notrealco" | "I'm sorry, the page you requested could not be found." | "Page Not Found" |
 | "13/4545"   | "Strange Characters in ID » Contacts"                   | "ADD CONTACT"    |


  Scenario Outline: Access a company's divisions page
	Given I go to the stable company divisions link for <company_id>
	Then I should see the text <text>
	
    Examples:
    | company_id   | text                                                    | 
    | "NSC1234"    | "Company Directory » NASCAR » Divisions"                                    |
    | "taylormade" | "Company Directory » TAYLOR MADE » Divisions"                               |
    | "notrealco"  | "I'm sorry, the page you requested could not be found." |

  Scenario Outline: Access a company's divisions page with parameters
    Given I go to the stable parameters company divisions link for <company_id>
    Then I should see the text <text>

	Examples:
    | company_id   | text                                                    |
    | "NSC1234"    | "Company Directory » NASCAR » Divisions"                                    |
    | "taylormade" | "Company Directory » TAYLOR MADE » Divisions"                               |
    | "notrealco"  | "I'm sorry, the page you requested could not be found." |
    | "13/4545"    | "Company Directory » Strange Characters in ID » Divisions"                  |
	
  Scenario Outline: Access a specific contact by email address
    Given I go to the stable contact link for <email>
    Then I should see the text <text>
    And I should see the div <div>

    Examples:
    | email                                   | text                                                    | div              |
    | "sbourdeau+kb@qamail1.rollstream.com"   | "Contacts » Kyle Busch » Profile"                       | "Edit Contact"   |
    | "SbOurdeAu+KB@QamaiL1.RollStreaM.Com"   | "Contacts » Kyle Busch » Profile"                       | "Edit Contact"   |
    | "fake@email.com"                        | "I'm sorry, the page you requested could not be found." | "Page Not Found" |
    | "as;lfjafa"                             | "I'm sorry, the page you requested could not be found." | "Page Not Found" |
    | "sbourdeau%2Bmp@qamail1.rollstream.com" | "Mizuno Participant"            | "More than one contact found for the given email address" |

  Scenario Outline: Access a specific contact by email address with parameters
    Given I go to the stable parameters contact link for <email>
	Then I should see the text <text>
	And I should see the div <div>

	Examples:
    | email                                 | text                                                    | div              |
    | "sbourdeau%2Bkb@qamail1.rollstream.com" | "Contacts » Kyle Busch » Profile"                       | "Edit Contact"   |
    | "SbOurdeAu%2BKB@QamaiL1.RollStreaM.Com" | "Contacts » Kyle Busch » Profile"                       | "Edit Contact"   |
    | "fake@email.com"                      | "I'm sorry, the page you requested could not be found." | "Page Not Found" |
    | "as;lfjafa"                           | "I'm sorry, the page you requested could not be found." | "Page Not Found" |

  Scenario Outline: Access a specific contact by email address and company id
	Given I go to the stable contact link with company for <email> in <company_id>
	Then I should see the text <text>
	And I should see the div <div>
	
	Examples:
    | email                                   | company_id   | text                                                    | div              |
    | "sbourdeau%2Bkb@qamail1.rollstream.com" | "NSC1234"    | "Contacts » Kyle Busch » Profile"                       | "Edit Contact"   |
    | "sbourdeau%2Btp@qamail1.rollstream.com" | "taylormade" | "Contacts » Taylor Participant » Profile"               | "Edit Contact"   |
    | "sbourdeau%2Bkb@qamail1.rollstream.com" | "taylormade" | "I'm sorry, the page you requested could not be found." | "Page Not Found" |
    | "SbOurdeAu%2BKB@QamaiL1.RollStreaM.Com" | "NSC1234"    | "Contacts » Kyle Busch » Profile"                       | "Edit Contact"   |
    | "fake@email.com"                        | "taylormade" | "I'm sorry, the page you requested could not be found." | "Page Not Found" |
    | "sbourdeau%2Bkb@qamail1.rollstream.com" | "asfasf;f"   | "I'm sorry, the page you requested could not be found." | "Page Not Found" |
    | "a;lfjas;fjs"                           | "asfasf;f"   | "I'm sorry, the page you requested could not be found." | "Page Not Found" |
    | "sbourdeau%2Bmp@qamail1.rollstream.com" | "callaway"   | "Contacts » Callaway Participant » Profile"              | "Edit Contact"   |
    | "sbourdeau%2Bmp@qamail1.rollstream.com" | "mizuno"     | "Contacts » Mizuno Participant » Profile"               | "Edit Contact"   |

  Scenario Outline: Access a specific contact by email address and company id, with parameters
	Given I go to the stable parameters contact link with company for <email> in <company_id>
	Then I should see the text <text>
	And I should see the div <div>

	Examples:
    | email                                   | company_id   | text                                                    | div              |
    | "sbourdeau%2Bkb@qamail1.rollstream.com" | "NSC1234"    | "Contacts » Kyle Busch » Profile"                       | "Edit Contact"   |
    | "sbourdeau%2Btp@qamail1.rollstream.com" | "taylormade" | "Contacts » Taylor Participant » Profile"               | "Edit Contact"   |
    | "sbourdeau%2Bkb@qamail1.rollstream.com" | "taylormade" | "I'm sorry, the page you requested could not be found." | "Page Not Found" |
    | "SbOurdeAu%2BKB@QamaiL1.RollStreaM.Com" | "NSC1234"    | "Contacts » Kyle Busch » Profile"                       | "Edit Contact"   |
    | "sbourdeau%2Bjg@qamail1.rollstream.com" | "13/4545"    | "Contacts » Jeff Gordon » Profile"                      | "Edit Contact"   |
    | "SbOurdeAu%2BJG@QamaiL1.RollStreaM.Com" | "13/4545"    | "Contacts » Jeff Gordon » Profile"                      | "Edit Contact"   |
    | "fake@email.com"                        | "taylormade" | "I'm sorry, the page you requested could not be found." | "Page Not Found" |
    | "sbourdeau%2Bkb@qamail1.rollstream.com" | "asfasf;f"   | "I'm sorry, the page you requested could not be found." | "Page Not Found" |
    | "a;lfjas;fjs"                           | "asfasf;f"   | "I'm sorry, the page you requested could not be found." | "Page Not Found" |
    | "sbourdeau%2Bmp@qamail1.rollstream.com" | "callaway"   | "Contacts » Callaway Participant » Profile"              | "Edit Contact"   |
    | "sbourdeau%2Bmp@qamail1.rollstream.com" | "mizuno"     | "Contacts » Mizuno Participant » Profile"               | "Edit Contact"   |
	
