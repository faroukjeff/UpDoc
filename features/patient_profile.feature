Feature: doctor_profile
As a doctor
So that I can see my patients data
I want to see my personal profile pages

Background: credentials have been added to database

  Given the following credentials exist:
  | username          | password    |
  | Jeff@bin.com      | Realmadrid1 |          
  | Joe@bon.com       | Mufc19      |
 

   Given the following profiles exist:      
      | username       | password    | first_name | last_name_string | address                          | pnumber   | Healthcare | docid           |
      | Jeff@bin.com   | Realmadrid1 | Jeff       | Baker            | 198 Main Street, Binghamton NY   | P0342567  | Geo Blue   | Aditya@bin.com  |
      | Aditya@bin.com | Arsenal4    | Aditya     |  Dere            | 144 Edward Street, Binghamton NY | D0445687  |            |                 |  
  

Scenario: Patient Profile Page
  Given I am on the login page
  And I have entered valid credential
  When I press "Log in"
  Then I should be on the profile page
  And I should see "Login successful"
  Then I should see "Name"
  And I should see "Patient Id"
  And I should see "Address"
  And I should see "View My Medical Records"
  And I should see "My Doctor"
  And I should see "Make an Appointment"
  
  
  
Scenario: Make an Appointment
  Given I am on the login page
  And I have entered valid credential
  When I press "Log in"
  Then I should be on the profile page
  And I should see "Login successful"
  When I follow "Make an Appointment"
  Then I should see "Available Appointments"
  Then I should see "Doctor"
  Then I should see "Slot"
  Then I should see "Doctor Email"
  Then I should see "Time Slot"
  Then I should see "Patient Name"
  
  
  


