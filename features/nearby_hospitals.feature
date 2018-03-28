Feature: find nearby hospitals
  
  As a user
  So that I can find hospitals near me
  I want to see a list of nearby hospitals
  
Scenario: default
  Given I am on the home page
  And I see Nearby Hospitals
  #When I follow Nearby Hospitals
  Then I should see Lourd
  And I should see Vestal Hospital
  And I should see University Hospital