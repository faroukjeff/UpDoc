Feature: find emergency contact number
  
  As a user
  So that I can find emergency contact numbers
  I want to see a list of emergency contact numbers

  
Scenario: default
  When I am on the home page
  Then I should see "Emergency Contact Numbers"
  When I click on "Emergency Contact Numbers"
  Then I should see "+1 607-2324639"
  And I should see "+212 636-184364"