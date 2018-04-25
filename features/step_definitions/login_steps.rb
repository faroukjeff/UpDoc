And /I have entered (in)?valid userpass/ do |invalid|
    #uname = /[^A-Za-z0-9]+[@][A-Za-z0-9]+[.][a-zA-Z$]+/
    #pword = /[^A-Za-z0-9]+/
    if invalid
        uname = "example@email"
        pword = "abc"
    else
        uname = "Aditya@bin.com"
        pword = "Arsenal4"
    end
    
    fill_in "Username", :with => uname
    fill_in "Password", :with => pword

end

And /I have entered (in)?valid credential/ do |invalid|
    #uname = /[^A-Za-z0-9]+[@][A-Za-z0-9]+[.][a-zA-Z$]+/
    #pword = /[^A-Za-z0-9]+/
    if invalid
        uname = "example@email"
        pword = "abc"
    else
        uname = "Jeff@bin.com"
        pword = "Realmadrid1"
    end
    
    fill_in "Username", :with => uname
    fill_in "Password", :with => pword

end

Given /the following credentials exist/ do |credentials|
    credentials.hashes.each do |cred|
        Credential.create!(cred)
    end
end


Given /the following profiles exist/ do |profiles|
    profiles.hashes.each do |prof|
        Profile.create!(prof)
    end
end