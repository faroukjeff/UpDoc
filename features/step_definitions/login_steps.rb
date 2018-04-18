And /I have entered (in)?valid credentials/ do |invalid|
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

Given /the following credentials exist/ do |credentials|
    credentials.hashes.each do |cred|
        Credential.create!(cred)
    end
end


