Feature: home page
  
  As a user
  So that I have a presence for my endeavors
  I want to see a homepage
  
Scenario: default
  Given I am on the home page
  Then I should see "Login"
  And I should see "Sign Up"
  And I should see "Nearby Hospitals"
  And I should see "Nearby Pharmacies"
  And I should see "Emergency Contact Numbers"
  And I should see "Jeff"