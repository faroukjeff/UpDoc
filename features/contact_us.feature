Feature: Contact Us
  
As a User 
so that I can view Contact Us page

Scenario: Contact Us
  Given I am on the home page
  Then I should see "Contact Us"
  When I follow "Contact Us"
  Then I should see "Contact Us via Email"
  And I should see "Or Phone Number"