Feature: Search Patient
As a doctor
I want to search for a patient
So that I can interact with their page

Background: credentials have been added to database

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



Scenario: Search Patient Page
  Given I am on the login page
  And I have entered valid userpass
  When I press "Log in"
  Then I should be on the doctor profile page
  And I should see "Login successful"
  And I should see "Search Patient"
  And I follow "Search Patient"
  Then I should see "Jeff Baker"

Scenario: Patient found
  Given I am on the login page
  And I have entered valid userpass
  When I press "Log in"
  Then I should be on the doctor profile page
  And I should see "Login successful"
  And I should see "Search Patient"
  And I follow "Search Patient"
  Then I should see "Enter Patient Name"
  And I have filled valid name
  When I press "Search"
  Then I should see "Jeff Baker"
  And I should see "P0342567"
  And I should see "198 Main Street, Binghamton NY"

Scenario: Patient not found
 Given I am on the login page
  And I have entered valid userpass
  When I press "Log in"
  Then I should be on the doctor profile page
  And I should see "Login successful"
  And I should see "Search Patient"
  And I follow "Search Patient"
  Then I should see "Enter Patient Name"
  And I have filled invalid name
  When I press "Search"
  Then I should see "Patient not found"

