Feature: admin page

As an admin
So that I can manage hospital staff
I want to log in to my admin profile

Background: credentials have been added to database

#  Given the following profiles exist:
#  | username          | password    | first_name |  last_name_string | address                             | pnumber  | docid         |
#  | Aditya@bin.com    | Arsenal4    | Aditya     |  Dere             | 144 Edward Street, Binghamton NY    | D0445687 | nil           |
#  | Alice@bon.com     | Alice119    | Alice      |  Lane             | 74 Edward Street, Binghamton NY     | D04489756| nil           |
#  | Sue@oracle.com    | Sue19       | Sue        |  Chi              | 84 Chapin Street, Binghamton NY     | P0796542 | Alice@bon.com |
#  | New@bun.com       | New8        | New        |  Patient          | 7000 Thousand Street, Binghamton NY | P0997457 | nil           |  

Scenario:  
  Given I am on the admin admin page
  #Then I should see a table of users  #define in admin_steps.rb
  And I should see "Create doctor account"
  And I should see "Link doctor to patient"
  
Scenario:
  Given I am on the admin admin page
  When I follow "Link doctor to patient"
  Then I should be on the admin linkdoc page
  And I should see "Doctor Email"
  And I should see "Patient Email"
  
Scenario:
  Given I am on the admin admin page
  When I follow "Create doctor account"
  Then I should be on the admin docsignup page
  And I should see "Add Doctor"
  And I should see "Email"
  And I should see "Confirm Password"
  And I should see "Doctor ID"