Feature: login

  As a patient
  So that I can manage my appointments and information
  I want to log in
  
Background: credentials have been added to database

  Given the following credentials exist:
  | username          | password    |      
  | Aditya@bin.com    | Arsenal4    |   
  | Jeff@bin.com      | Realmadrid1 |          
  | Joe@bon.com       | Mufc19      |
  

Scenario:
  Given I am on the home page
  When I follow "Login"
  Then I should see "Username"
  And I should see "Password"

Scenario:
  Given I am on the login page
  And I have entered valid credentials
  When I press "Log in"
  Then I should be on the profile page
  And I should see "Login successful"

Scenario:
  Given I am on the login page
  And I have entered invalid credentials
  When I press "Log in"
  Then I should see "Wrong username/password"
  And I should see "Forgot Password?"
  And I should see "Sign Up"