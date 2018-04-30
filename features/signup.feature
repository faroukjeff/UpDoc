Feature: signup

Scenario:
    Given I am on the home page
    When I follow "Sign Up"
    Then I should see "First Name"
    Then I should see "Last Name"
    Then I should see "Phone Number"
    Then I should see "Health Insurance"
    
    
Scenario:
    Given I am on the home page
    When I follow "Sign Up"
    Then I should not see "Address"
    Then I should not see "Doctor"

    
