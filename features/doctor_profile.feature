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
  | username          | password    | first_name |  last_name_string | address                         | pnumber  |
  | Aditya@bin.com    | Arsenal4    | Aditya     |  Dere             | 144 Edward Street, Binghamton NY| D0445687 |
  | Alice@bon.com     | Alice119    | Alice      |  Lane             | 74 Edward Street, Binghamton NY | D04489756|
  
  

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

Scenario: Search Patients
Given I am on the login page
And I have entered valid userpass
When I press "Log in"
Then I should be on the doctor profile page
Then I should see "Search Patient"
And I follow "Search Patient"
Then I should see "Search Patient"

Scenario: My Appointments
Given I am on the login page
And I have entered valid userpass
When I press "Log in"
Then I should be on the doctor profile page
Then I should see "My Appointments"
And I follow "My Appointments"
Then I should see "My Appointments"
And I should see "Patient"
And I should see "Doctor"
And I should see "Slot"
And I should see "Availability"
