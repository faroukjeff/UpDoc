Feature: admin page
  
As an admin
So that I can manage hospital staff
I want to log in to my admin profile


Background: credentials have been added to database

  Given the following profiles exist:
  | username          | password    | first_name |  last_name_string | address                             | pnumber  | docid         |
  | Aditya@bin.com    | Arsenal4    | Aditya     |  Dere             | 144 Edward Street, Binghamton NY    | D0445687 | nil           |
  | Alice@bon.com     | Alice119    | Alice      |  Lane             | 74 Edward Street, Binghamton NY     | D04489756| nil           |
  | Sue@oracle.com    | Sue19       | Sue        |  Chi              | 84 Chapin Street, Binghamton NY     | P0796542 | Alice@bon.com |
  | New@bun.com       | New8        | New        |  Patient          | 7000 Thousand Street, Binghamton NY | P0997457 | nil           |  

Scenario:  
  Given I am on the admin page
  Then I should see a table of users  #define in admin_steps.rb
  And I should see "Add patient"
  And I should see "Add doctor"
  And I should see "Link doctor"
  
Scenario:
  Given I am on the admin page
  When I click Link doctor
  Then I should see "Enter docID:"
  And I should see "Submit"
  
Scenario:
  Given I am on the admin page
  And I click Link doctor
  And I fill in "docid" with "Aditya@bin.com"
  Then I should be on the admin page
  And I should see #the patient now has Aditya as doctor