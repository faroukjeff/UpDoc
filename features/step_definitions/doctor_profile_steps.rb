When /I click a patient name/ do
    steps %Q{When I follow "Jeff Baker"}
end

And /I have entered (in)?valid patient information/ do |invalid|
    #uname = /[^A-Za-z0-9]+[@][A-Za-z0-9]+[.][a-zA-Z$]+/
    #pword = /[^A-Za-z0-9]+/
    if invalid
        first_name = "Dalai"
        last_name_string = "Lama"
    else
        first_name = "Jeff"
        last_name_string = "Baker"
    end
    
    fill_in "First name", :with => first_name
    fill_in "Last name", :with => last_name_string
end

Then /I should see the patients information/ do
    steps %Q{Then I should see "Jeff Baker"}
    steps %Q{And I should see "Geo Blue"}
    steps %Q{And I should see "198 Main Street, Binghamton NY"}
    steps %Q{And I should see "P0342567"}
end

Given /I have not completed the form/ do

end