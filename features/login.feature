Feature: login

  As a patient
  So that I can manage my appointments and information
  I want to log in

Scenario:
  Given I am on the home page
  When I follow "Login"
  Then I should see "Username"
  And I should see "Password"

Scenario:
  Given I am on the login page
  And I have entered valid credentials
  When I press "Log in"
  Then I should be on the home page
  And I should see "Login successful"

Scenario:
  Given I am on the login page
  And I have entered invalid credentials
  When I press "Log in"
  Then I should see "Wrong username/password"
  #And I should see "Forgot password?"
  #And I should see "Sign up"