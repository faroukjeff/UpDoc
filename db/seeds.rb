hospitals = [{:name=> 'Lourd', :pnumber=> '6072386492', :city=> 'Binghamton', :street=> 'Riverside Drive', :hnumber=> 66},
    	  {:name=> 'Vestal Hospital', :pnumber=> '6070006875', :city=> 'Vestal', :street=> 'Park', :hnumber=> 32},
    	  {:name=> 'University Hospital', :pnumber=> '6073216875', :city=> 'Binghamton', :street=> 'Vestal Parkway West', :hnumber=> 54}
  	 ]

pharmacies = [{:name=> 'Ab Pharma', :pnumber=> '12345678', :city=> 'Binghamton', :street=> 'Riverside Drive', :hnumber=> 27},
    	  {:name=> 'Jeff PHY', :pnumber=> '607345582', :city=> 'Vestal', :street=> 'East drive', :hnumber=> 46},
    	  {:name=> 'University Pharmacy', :pnumber=> '607125986', :city=> 'Binghamton', :street=> 'Vestal Parkway West', :hnumber=> 56}
  	 ]
  	 
credentials = [{:username=> 'Aditya@bin.com', :password=> 'Arsenal4', :usertype=> 'D'},
    	  {:username=> 'Jeff@bin.com', :password=> 'Realmadrid1', :usertype=>'P'},
    	  {:username=> 'Joe@bon.com', :password=> 'Mufc19', :usertype=> 'P'},
    	  {:username=> 'John@bon.com', :password=> 'John19', :usertype=> 'P'},
    	  {:username=> 'Rohit@gmail.com', :password=> 'Rohit17', :usertype=> 'P'},
    	  {:username=> 'Ron@gmail.com', :password=> 'Ron19', :usertype=> 'P'},
    	  {:username=> 'Ramesh@bon.com', :password=> 'Ramesh19', :usertype=> 'P'},
    	  {:username=> 'Sue@oracle.com', :password=> 'Sue19', :usertype=> 'P'},
    	  {:username=> 'Alice@bon.com', :password=> 'Alice119', :usertype=> 'D'}
  	 ]



profiles = [{:username=> "Jeff@bin.com",:first_name=>"Jeff",:last_name_string=>"Baker",:address=>"198 Main Street, Binghamton NY",:pnumber=>"P0342567",:Healthcare=>"Geo Blue",:password=>"Realmadrid1",:docid=>"Aditya@bin.com"},
            {:username=> "Joe@bon.com",:first_name=>"Joe",:last_name_string=>"Williams",:address=>"22 Main Street, Binghamton NY",:pnumber=>"P0342896",:Healthcare=>"United Healthcare",:password=>"Mufc19",:docid=>"Aditya@bin.com"},
            {:username=> "John@bon.com",:first_name=>"John",:last_name_string=>"Kent",:address=>"45 Chapin Street, Binghamton NY",:pnumber=>"P0895642",:Healthcare=>"United Healthcare",:password=>"John19",:docid=>"Alice@bon.com"},
            {:username=> "Rohit@gmail.com",:first_name=>"Rohit",:last_name_string=>"R",:address=>"145 Chapin Street, NJ",:pnumber=>"P0895648",:Healthcare=>"United Healthcare",:password=>"Rohit17",:docid=>"Alice@bon.com"},
            {:username=> "Ron@gmail.com",:first_name=>"Ron",:last_name_string=>"Jeffer",:address=>"145 Main Street, NJ",:pnumber=>"P0895682",:Healthcare=>"Geo Blue",:password=>"Ron19",:docid=>"Alice@bon.com"},
            {:username=> "Ramesh@bon.com",:first_name=>"Ramesh",:last_name_string=>"Kale",:address=>"222 Edward Street, Binghamton NY",:pnumber=>"P0898752",:Healthcare=>"United Healthcare",:password=>"Ramesh19",:docid=>"Alice@bon.com"},
            {:username=> "Sue@oracle.com",:first_name=>"Sue",:last_name_string=>"Chi",:address=>"84 Chapin Street, Binghamton NY",:pnumber=>"P0796542",:Healthcare=>"United Healthcare",:password=>"Sue19",:docid=>"Alice@bon.com"},
            {:username=> "Aditya@bin.com",:first_name=>"Aditya",:last_name_string=>"Dere",:address=>"144 Edward Street, Binghamton NY",:pnumber=>"D0445687",:password=>"Arsenal4"},
            {:username=> "Alice@bon.com",:first_name=>"Alice",:last_name_string=>"Lane",:address=>"74 Edward Street, Binghamton NY",:pnumber=>"D04489756",:password=>"Alice119"}
           
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

profiles.each do |profiles|
 Profile.create!(profiles)
end