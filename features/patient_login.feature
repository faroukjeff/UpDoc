Feature: login

  As a patient
  So that I can manage my appointments and information
  I want to log in
  
Background: credentials have been added to database

  Given the following credentials exist:
  | username          | password    | usertype |
  | Jeff@bin.com      | Realmadrid1 |  P       |       
  | Joe@bon.com       | Mufc19      |  P       |
 

   Given the following profiles exist:      
      | username       | password    | first_name | last_name_string | address                          | pnumber   | Healthcare | docid           |
      | Jeff@bin.com   | Realmadrid1 | Jeff       | Baker            | 198 Main Street, Binghamton NY   | P0342567  | Geo Blue   | Aditya@bin.com  |
      | Aditya@bin.com | Arsenal4    | Aditya     |  Dere            | 144 Edward Street, Binghamton NY | D0445687  |            |                 |  

Scenario:
  Given I am on the home page
  When I follow "Login"
  Then I should see "Username"
  And I should see "Password"

Scenario:
  Given I am on the login page
  And I have entered valid credential
  When I press "Log in"
  Then I should be on the profile page
  And I should see "Login successful"

Scenario:
  Given I am on the login page
  And I have entered invalid credential
  When I press "Log in"
  Then I should see "Wrong username/password"
  And I should see "Forgot Password?"
  And I should see "Sign Up"