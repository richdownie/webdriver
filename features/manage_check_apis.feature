@wip
Feature: Manage check_apis
   In order to use api 
   by users 
   wants CRUD + Search
   @get
   Scenario Outline: Verifying GET on api
     Given On server "https://stgirish.rollstream.com/api/v2000"
     And As user "<username>" with password "<password>"
     And I Want to get "<resource>"  with id "<id>"
     Then It should respond with "<response_code>"
     And The field "<field>" should contain the value "<value>"
   Examples:
     | username | password | resource | id | response_code | field | value |
     # Get of contact 1 as a CA
     | sbourdeau@qamail1.rollstream.com | rollstream123 | contact | 13 | 200 | LastName | Downie |
     # Get of a contact as a non-existing contact
     | fakecontact@qamail1.rollstream.com | rollstream123 | contact | 1 | 401 |  |  |
     # Get of contact 7 as CA
     | sbourdeau@qamail1.rollstream.com | rollstream123 | contact | 7 | 200 | FirstName | Scott |
     # Get of contact as a company administrator
     | rdownie+ca@qamail1.rollstream.com | testing1 | contact | 11 | 401 | ErrorMessage | not authorized |
     # Get a non-existent contact as a CA
     | sbourdeau@qamail1.rollstream.com | rollstream123 | contact | 341 | 404 | ErrorMessage | Not Found |
     # Get a non-existent contact as a non-CA
     | rdownie+jabbott@qamail1.rollstream.com | testing1 | contact | 341 | 404 | ErrorMessage | Not Found |
     # Get of a contact as someone who does not have permission to view contacts
     | sbourdeau+kb@qamail1.rollstream.com | rollstream123 | contact | 7 | 401 | ErrorMessage | not authorized |
     # Get as CA of a contact who has a file uploaded into a regular CFG file upload field
     | sbourdeau@qamail1.rollstream.com | rollstream123 | contact | 39 | 200 | Social Security Card | https://stgirish.rollstream.com/api/v2000/Contact/39/file/95/0?apiKey=covidien |
     # Get as CA of a contact who has a file uploaded into a tabular CFG file upload field
     | sbourdeau@qamail1.rollstream.com | rollstream123 | contact | 39 | 200 | T_FILE_UPLOAD | https://stgirish.rollstream.com/api/v2000/Contact/39/file/317/0?apiKey=covidien |
	 # Get of company 1 as a CA
     | sbourdeau@qamail1.rollstream.com | rollstream123 | company | 1 | 200 | Name | CIAUTO |
     # Get of a company as a non-existing contact
     | fakecontact@qamail1.rollstream.com | rollstream123 | company | 1 | 401 |  |  |
     # Get of company 7 as CA
     | sbourdeau@qamail1.rollstream.com | rollstream123 | company | 7 | 200 | CompanyID | NSC1234 |
     # Get of company as a company administrator
     | rdownie+ca@qamail1.rollstream.com | testing1 | company | 11 | 401 | ErrorMessage | not authorized |
     # Get a non-existent company as a CA
     | sbourdeau@qamail1.rollstream.com | rollstream123 | company | 100 | 404 | ErrorMessage | Not Found |
     # Get a non-existent company as a company administrator
     | rdownie+jabbott@qamail1.rollstream.com | testing1 | company | 100 | 404 | ErrorMessage | Not Found |
     # Get of a company as someone who does not have permission to view companies
     | sbourdeau+kb@qamail1.rollstream.com | rollstream123 | company | 7 | 401 | ErrorMessage | not authorized |
	 # Get as CA of a company who has a file uploaded into a regular CFG file upload field
     | sbourdeau@qamail1.rollstream.com | rollstream123 | company | 9 | 200 | R_FILE_UPLOAD | https://stgirish.rollstream.com/api/v2000/Company/9/file/10489/0?apiKey=covidien |
     # Get as CA of a company who has a file uploaded into a tabular CFG file upload field
     | sbourdeau@qamail1.rollstream.com | rollstream123 | company | 22 | 200 | T_FILE_UPLOAD | https://qaauto.rollstream.com/api/v2000/Company/22/file/1202/0?apiKey=covidien |
     # Get as company administrator of a company where a tabular custom field does not allow view/edit
     | rdownie+ca@qamail1.rollstream.com | testing1 | company | 22 | 200 | T_NO_CA_PERMISSION |  |
	 # Get as company administrator of a company where a regular custom field does not allow view/edit
     | rdownie+ca@qamail1.rollstream.com | testing1 | company | 22 | 200 | R_NO_CA_PERMISSION |  |
	
     
 
   @search
   Scenario Outline: Verifying SEARCH on api
     Given On server "https://stgirish.rollstream.com/api/v2000"
     And As user "<username>" with password "<password>"
     And I Want to search "<resource>"  file "<name>"
     Then It should respond with "<response_code>"
   Examples:
     | username | password | resource | name | response_code |
     # Search as a CA for any companies that contain 'a' in their id field
     | sbourdeau@qamail1.rollstream.com | rollstream123 | company | search_company_id_contains | 200 |
     # Search as a CA for any companies that are exactly in VA or NC
     | sbourdeau@qamail1.rollstream.com | rollstream123 | company | search_company_state_NCorVA | 200 |
	 # Search as a spoke contact for anything (no perms to view companies)
     | sbourdeau+kb@qamail1.rollstream.com | rollstream123 | company | search_company_state_NCorVA | 401 |
	 # Search as a company administrator for any companies that are exactly in VA or NC
     | rdownie+jabbott@qamail1.rollstream.com | testing1 | company | search_company_state_NCorVA | 200 |
     # Search as a company administrator for any company that has a name that ends with 'q' (zero results)
     | rdownie+jabbott@qamail1.rollstream.com | testing1 | company | search_company_name_endswith_q | 200 |
     # Search as a CA for a company by "last updated"
     | sbourdeau@qamail1.rollstream.com | rollstream123 | company | search_company_updated_at | 200 |
     # Search as a CA for a contact by "last updated"
     | sbourdeau@qamail1.rollstream.com | rollstream123 | contact | search_contact_updated_at| 200 |
     # Search as a company administrator for a company by "last updated"
     | rdownie+jabbott@qamail1.rollstream.com | testing1 | company | search_company_updated_at | 200 |
     # Search as a company administrator for a contact by "last updated"
     | rdownie+jabbott@qamail1.rollstream.com | testing1 | contact | search_company_updated_at | 200 |
     
   Scenario Outline: Verifying PUT on api
     Given On server "https://stgirish.rollstream.com/api/v2000"
     And As user "<username>" with password "<password>"
     And I Want to update "<resource>"  with "<id>" file "<name>"
     Then It should respond with "<response_code>"
   Examples:
     | username | password | resource | id | name | response_code |
     # Put as a CA; update the notes field of a company
     | sbourdeau@qamail1.rollstream.com           | rollstream123 | company | 8 | put_company_notes | 200 |
     | aju+project_admin@qamail1.rollstream.com   | rollstream123 | company | 1 | up_company        | 401 |
     | aju+project_admin_2@qamail1.rollstream.com | rollstream123 | company | 1 | up_company        | 401 |
     | sample@example.org                         | safe4now      | company | 1 | up_company        | 200 |
     | aju+contact@qamail1.rollstream.com         | rollstream123 | company | 1 | up_company        | 401 |
     | aju+employee_1@qamail1.rollstream.com      | rollstream123 | company | 1 | up_company        | 401 |
 
   @destroy @wip
   Scenario Outline: Verifying DESTROY on api
     Given On server "https://qaaztec.rollstream.com/api/v2000"
     And As user "<username>" with password "<password>"
     And I Want to  create "<resource>"   using "<name>"
     Then It should respond with "<response_code>"
   Examples:
     | username    | password | resource | name       | response_code |
     | sampkljhjtr | safe4now | contact  | con_create | 200           |
