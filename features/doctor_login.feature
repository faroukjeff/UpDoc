Feature: Doctor_login

   As a doctor
So that I can manage my patients
I want to log in
  
Background: credentials have been added to database

  Given the following credentials exist:
  | username          | password    | usertype |     
  | Aditya@bin.com    | Arsenal4    | D        |
  | Alice@bon.com     | Alice119    | D        |
  
  Given the following profiles exist:
  | username          | password    | first_name |  last_name_string | address                         | pnumber  |
  | Aditya@bin.com    | Arsenal4    | Aditya     |  Dere             | 144 Edward Street, Binghamton NY| D0445687 |
  | Alice@bon.com     | Alice119    | Alice      |  Lane             | 74 Edward Street, Binghamton NY | D04489756|
  
  

Scenario:
  Given I am on the home page
  When I follow "Login"
  Then I should see "Username"
  And I should see "Password"

Scenario:
  Given I am on the login page
  And I have entered valid userpass
  When I press "Log in"
  Then I should be on the doctor profile page
  And I should see "Login successful"

Scenario:
  Given I am on the login page
  And I have entered invalid userpass
  When I press "Log in"
  Then I should see "Wrong username/password"
  And I should see "Forgot Password?"
  And I should see "Sign Up"