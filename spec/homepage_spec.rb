require 'rails_helper'


RSpec.describe "homepage", :type => :feature do
  it "displays the user's username after successful login" do
    
=begin
    user = Credential.create!(:username => "Aditya@bin.com", :password => "Arsenal4", :usertype => "D")
    get "/login"
    
    #page.should have_content('Username')
    #assert_select "form.login" do
     # assert_select "input[name=?]", "session[username]"
     # assert_select "input[name=?]", "session[password]"
     # assert_select "input[type=?]", "submit"
    #end

    #post "/login", :username => "Aditya@bin.com", :password => "Arsenal4", :usertype => "D"
    
    fill_in 'session[username]', with: "Aditya@bin.com"
    fill_in 'session[password]', with: "Arsenal4"
    click_button('Log in')
    
    
    #assert_select ".header .username", :text => "Aditya Dere"
     
     user = FactoryBot.create(:user, :username => "Aditya@bin.com", :password => "Arsenal4")
    visit "/login"
    fill_in "Username", :with => "Aditya@bin.com"
    fill_in "Password", :with => "Arsenal4"
    click_button "Log in"

    expect(page).to have_selector(".header .username", :text => "jdoe")
    
=end

    visit login_path
    within "form#login" do
      expect(page).to have_selector "input#session_username"
    end


end
  
end