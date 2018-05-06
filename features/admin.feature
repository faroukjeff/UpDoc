Feature: admin page

As an admin
So that I can manage hospital staff
I want to log in to my admin profile

Scenario:Admin Page
Given I am on the admin admin page
And I should see "Sign Up Doc"
And I should see "Link Doctor to patient"
And I should see "Add Doctor to Appointment Table"
And I should see "Reset Appointment Table"


Scenario: Link Doctor to patient
Given I am on the admin admin page
When I follow "Link Doctor to patient"
Then I should be on the admin linkdoc page
And I should see "Doctor Email"
And I should see "Patient Email"

Scenario: Sign Up doctor
Given I am on the admin admin page
When I follow "Sign Up Doc"
Then I should be on the admin docsignup page
And I should see "First Name"
And I should see "Email"
And I should see "Confirm Password"
And I should see "Doctor Id"

Scenario: Adding Doctor to Appointment table
Given I am on the admin admin page
When I follow "Add Doctor to Appointment Table"
Then I should be on the admin docappt page
And I should see "Doctor Email"
And I should see "Appointment Time Slot"

