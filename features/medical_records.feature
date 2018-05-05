Feature: Patient Records
As a doctor
So that I can see my patients data
I want to see my personal profile pages

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


Scenario: Medical History Page
  Given I am on the login page
  And I have entered valid userpass
  When I press "Log in"
  Then I should be on the doctor profile page
  And I should see "Login successful"
  Then I should see "Name"
  And I should see "Doctor Id"
  And I should see "Address"
  And I should see "Jeff Baker"
  And I follow "Jeff Baker"
  Then I should see "Medical History"
  And I should see "Patient Id"
  And I should see "High Blood Pressure"
  And I should see "Diabetes"
  And I should see "Diarrhea"
  And I should see "Back Pain"
  And I should see "Kidney Stones"
  
  