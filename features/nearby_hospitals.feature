Feature: find nearby hospitals
  
  As a user
  So that I can find hospitals near me
  I want to see a list of nearby hospitals

Background: hospitals have been added to database

  Given the following hospitals exist:
  | name                    | street              | city        | hnumber |  pnumber |
  | Lourd                   | Riverside Drive     | Binghamton  | 66      | 60745678 |
  | Vestal Hospital         | Park                | Vestal      | 57      | 60745673 |
  | University Hospital     | Vestal Parkway West | Binghamton  | 56      | 60745672 |
  
Scenario: default
  When I am on the home page
  Then I should see "Nearby Hospitals"
  When I click on "Nearby Hospitals"
  Then I should get "Lourd"
  And I should see "Vestal Hospital"
  And I should see "University Hospital"