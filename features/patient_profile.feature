Feature: patient profile
  As a patient
  I want to have a profile page
  So that I can access my information
  
Background: credentials have been added to database

  Given the following credentials exist:
  | username          | password    | usertype | 
  | Jeff@bin.com      | Realmadrid1 | P        |         
  | Joe@bon.com       | Mufc19      | P        |
  | Aditya@bin.com    | Arsenal4    | D        |

Scenario: Landing page
  Given I am on the login page
  And I have entered valid credential
  When I press "Log in"
  Then I should be on the profile page
  And I should see "Name"
  And I should see "Address"
  And I should see "Healthcare"
  And I should see "Doctor"
  And I should see "Make an appointment"
  And I should see "Medical History"
  
Scenario: Make Appointment
  Given I am on the login page
  And I have entered valid credential
  When I press "Log in"
  Then I should be on the profile page
  And I press "Make an appointment"
  Then I should be on the make appointment page