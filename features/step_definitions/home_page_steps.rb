
Given /the following hospitals exist/ do |hospitals|
    hospitals.hashes.each do |hospital|
        Hospital.create!(hospital)
    end
end

Given /the following pharmacies exist/ do |pharmacies|
    pharmacies.hashes.each do |pharmacy|
        Pharmacy.create!(pharmacy)
    end
end

#find(:css, '#hospital_div').should be_visible
#find('#hospital_div').click()
  
When /^(?:|I )click on "([^"]*)"$/ do |link|
  find('#hospital_div').click() 
 
end


Then /^(?:|I )should get "([^"]*)"$/ do |text|
     
  if page.respond_to? :should
     find('#hospital_div').click()  
    #page.all(".articles .article[id='foo']").should have_content(text)
    find("#hospitals", visible: false).should have_content(text)
    #page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

