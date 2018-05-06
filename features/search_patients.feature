Feature: Search patients
As a doctor
I want to search for a patient
So that I can interact with their page

Background:
    Given the following credentials exist:
  | username          | password    | usertype |  
  | Aditya@bin.com    | Arsenal4    | D        |
  
  
    Given the following profiles exist:
  | username          | password    | first_name |  last_name_string | address                         | pnumber  |  Healthcare |   docid           |
  | Aditya@bin.com    | Arsenal4    | Aditya     |  Dere             | 144 Edward Street, Binghamton NY| D0445687 |             |                   |
  | Jeff@bin.com      | Realmadrid1 | Jeff       |  Baker            | 198 Main Street, Binghamton NY  | P0342567 |  Geo Blue   |  Aditya@bin.com   |
  
  Given the following medical_records exist:
  | pnumber   | name      | address                         | healthcare |  medhistory                                                      | meddata   |
  | P0342567  |Jeff Baker | 198 Main Street, Binghamton NY  | Geo Blue   |  High Blood Pressure,Diabetes,Diarrhea,Back Pain,Kidney Stones   | 0,1,1,0,1 |
  
  Given I am on the login page
  And I have entered valid userpass
  And I press "Log in"
  Then I should be on the doctor profile page

Scenario: Patient found
    Given I have entered valid patient information
    When I press "Search"
    Then I should see the patients information

Scenario: Patient not found
    Given I have entered invalid patient information
    When I press "Search"
    Then I should see "Patient not found"

Scenario: Incomplete form
    Given I have not completed the form
    When I press "Search"
    Then I should see "Please fill in all fields"