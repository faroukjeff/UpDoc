Feature: As a patient
So that I can create a patient profile
I want to sign up

  Given the following credentials exist:
  | username          | password    |
  | rr@r.com            | Hi |          

Scenario: Go to Sign Up page
Given I am on the home page
When I follow "Sign Up"
Then I should see "Name"
And I should see "Email"
And I should see "Address"
And I should see "Health Provider"
And I should see "Password"

Scenario: Success
Given I am on the home page
When I follow "Sign Up"
Then I fill in "First Name" with "Rohith"
Then I fill in "Last Name" with "Reddy"
Then I fill in "Email" with "rr@r.com"
Then I fill in "Address" with "18 Conklin Ave"
Then I fill in "Health Provider" with "Cigna"
Then I fill in "Password" with "Hi"
Then I fill in "Confirm Password" with "Hi"
When I press "Sign Up"
Then I should see "Username"
Then I should see "Password"
And I have entered valid credential
When I press "Log in"
Then I should be on the profile page 

Scenario: Incomplete fields
Given I am on the home page
When I follow "Sign Up"
Then I fill in "Email" with "rr@r.com"
When I press "Sign Up"
Then I should see "Fields cannot be null"

Scenario: unmatched passwords
Given I am on the home page
When I follow "Sign Up"
Then I fill in "Password" with "Hi"
Then I fill in "Confirm Password" with "No Hi"
When I press "Sign Up"
Then I should see "Passwords don't match"

Scenario: Invalid Email
Given I am on the home page
When I follow "Sign Up"
And I fill in "Email" with "rrrr"
When I press "Sign Up"
Then I should see "Invalid Email"
