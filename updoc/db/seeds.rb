hospitals = [{:name=> 'Lourd', :pnumber=> '6072386492', :city=> 'Binghamton', :street=> 'Riverside Drive', :hnumber=> 66},
    	  {:name=> 'Vestal Hospital', :pnumber=> '6070006875', :city=> 'Vestal', :street=> 'Park', :hnumber=> 32},
    	  {:name=> 'University Hospital', :pnumber=> '6073216875', :city=> 'Binghamton', :street=> 'Vestal Parkway West', :hnumber=> 54}
  	 ]
  	 

hospitals.each do |hospital|
  Hospital.create!(hospital)
end
