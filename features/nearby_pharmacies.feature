Feature: find nearby pharmacies
  
  As a user
  So that I can find pharmacies near me
  I want to see a list of nearby pharmacies

Background: pharmacies have been added to database

  Given the following pharmacies exist:
  | name                    | street              | city        | hnumber |  pnumber |
  | Ab Pharma               | Riverside Drive     | Binghamton  | 56      | 60789456 |
  | Jeff PHY                | East drive          | Vestal      | 54      | 654897123|
  | University Pharmacy     | Vestal Parkway West | Binghamton  | 78      | 65487922 |
  
Scenario: default
  When I am on the home page
  Then I should see "Nearby Pharmacies"
  When I click on "Nearby Pharmacies"
  Then I should see "Ab Pharma"
  And I should see "Jeff PHY"
  And I should see "University Pharmacy"