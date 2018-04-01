
Given /the following hospitals exist/ do |hospitals|
    hospitals.hashes.each do |hospital|
        Hospital.create!(hospital)
    end
end

When /^(?:|I )click on "([^"]*)"$/ do |link|
  find('#hospital_div').click()
end

