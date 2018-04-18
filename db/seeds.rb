hospitals = [{:name=> 'Lourd', :pnumber=> '6072386492', :city=> 'Binghamton', :street=> 'Riverside Drive', :hnumber=> 66},
    	  {:name=> 'Vestal Hospital', :pnumber=> '6070006875', :city=> 'Vestal', :street=> 'Park', :hnumber=> 32},
    	  {:name=> 'University Hospital', :pnumber=> '6073216875', :city=> 'Binghamton', :street=> 'Vestal Parkway West', :hnumber=> 54}
  	 ]

pharmacies = [{:name=> 'Ab Pharma', :pnumber=> '12345678', :city=> 'Binghamton', :street=> 'Riverside Drive', :hnumber=> 27},
    	  {:name=> 'Jeff PHY', :pnumber=> '607345582', :city=> 'Vestal', :street=> 'East drive', :hnumber=> 46},
    	  {:name=> 'University Pharmacy', :pnumber=> '607125986', :city=> 'Binghamton', :street=> 'Vestal Parkway West', :hnumber=> 56}
  	 ]
  	 
credentials = [{:username=> 'Aditya@bin.com', :password=> 'Arsenal4'},
    	  {:username=> 'Jeff@bin.com', :password=> 'Realmadrid1'},
    	  {:username=> 'Joe@bon.com', :password=> 'Mufc19'}
  	 ]
  	 

hospitals.each do |hospital|
  Hospital.create!(hospital)
end

pharmacies.each do |pharmacy|
 Pharmacy.create!(pharmacy)
end

credentials.each do |credential|
 Credential.create!(credential)
end