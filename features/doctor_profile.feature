Feature: doctor_profile
As a doctor
So that I can see my patients data
I want to see my personal profile pages

Background: credentials have been added to database

  Given the following credentials exist:
  | username          | password    | usertype |  
  | Aditya@bin.com    | Arsenal4    | D        |
  | Alice@bon.com     | Alice119    | D        |
  
    Given the following profiles exist:
  | username          | password    | first_name |  last_name_string | address                         | pnumber  | docid         |
  | Aditya@bin.com    | Arsenal4    | Aditya     |  Dere             | 144 Edward Street, Binghamton NY| D0445687 | nil |
  | Alice@bon.com     | Alice119    | Alice      |  Lane             | 74 Edward Street, Binghamton NY | D04489756| nil |
  | Jeff@bin.com      | Realmadrid1 | Jeff       |  Baker            | 198 Main Street, Binghamton NY  | P0342567 | Aditya@bin.com |

  Given the following medical records exist:
  | name       | address                         | pnumber  | healthcare | medhistory                                                    | meddata   |
  | Jeff Baker | 198 Main Street, Binghamton NY  | P0342567 | Geo Blue   | High Blood Pressure,Diabetes,Diarrhea,Back Pain,Kidney Stones | 0,1,1,0,1 |
  
  

Scenario: Login
  Given I am on the login page
  And I have entered valid userpass
  When I press "Log in"
  Then I should be on the doctor profile page
  And I should see "Login successful"
  Then I should see "Name"
  And I should see "Doctor Id"
  And I should see "Address"

#Scenario: Patient List
#Given I am on the profile page
#And I should see my patients names
#Then I should see my patients next appointment
#And I should see my patients symptoms

Scenario: Patient List
Given I am on the login page
And I have entered valid userpass
When I press "Log in"
Then I should be on the doctor profile page
And I should see "My Patients"
And I should see "Name"
And I should see "Healthcare"
And I should see "Pnumber"
#Then I should see my patients next appointment
#And I should see my patients symptoms

Scenario: View Medical Record
  #Given I have logged in
  #And I am on the doctor profile page
  Given I am on the login page
  And I have entered valid userpass
  And I press "Log in"
  And I should be on the doctor profile page
  When I click a patient name
  Then I should see "Medical History"
  And I should see "High Blood Pressure"
  And I should see "Diabetes"
  

Scenario: Search Patients
Given I am on the login page
And I have entered valid userpass
When I press "Log in"
Then I should be on the doctor profile page
Then I should see "Search Patient"
And I follow "Search Patient"
Then I should see "Search Result"