And /I have entered (in)?valid credentials/ do |invalid|
    #uname = /[^A-Za-z0-9]+[@][A-Za-z0-9]+[.][a-zA-Z$]+/
    #pword = /[^A-Za-z0-9]+/
    if invalid
        uname = "example@email"
        pword = ""
    else
        uname = "example@email.com"
        pword = "example"
    end
    steps %Q{I fill in email_field with "#{uname}"}
    steps %Q{I fill in password_field with "#{pword}"}
    #fill username field w uname
    #fill password field w pword
end