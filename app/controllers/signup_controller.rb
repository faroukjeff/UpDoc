class SignupController < ApplicationController

    def signup_params
      params.require(:session).permit(:first_name,:last_name_string,:username, :address, :pnumber, :Healthcare, :password, :confirmPassword)
    end
    
    def add
            id = params[:session]
            @first_name = id["first_name"]
            @last_name_string = id["last_name_string"]
            @username = id["username"]
            @address = id["address"]
            @Healthcare = id["Healthcare"]
            @password = id["password"] 
            @confirmPassword = id["confirmPassword"]
            
            
            while (true)
               @rand= rand 1000000..9999999
               data = Profile.where(:pnumber => @rand)
               if data == []
                 @pnumber = "P" + @rand.to_s
                 break;
               end         
            end
            
            isNull = true if(@first_name.empty? || @last_name_string.empty? || @username.empty? || @address.empty? || @pnumber.empty? || @Healthcare.empty? || @password.empty? || @confirmPassword.empty?)
            
            flash[:notice] = "Passwords don't match" and redirect_to signup_signup_path and return if(@password != @confirmPassword)
            flash[:notice] = "Fields cannot be null" and redirect_to signup_signup_path and return if (isNull)
            
            Profile.create!(:username => @username, :first_name => @first_name, :last_name_string => @last_name_string, :address => @address, :pnumber => @pnumber, :password => @password, :Healthcare => @Healthcare,:docid => "Adimn@updoc.com")
            Credential.create!(:username => @username, :password=> @password, :usertype=> 'P')
            
            
            MedicalRecord.create!(:pnumber => @pnumber,:name => @first_name + " " + @last_name_string ,:address => @address,:healthcare => @Healthcare,:medhistory => "High Blood Pressure,Diabetes,Diarrhea,Back Pain,Kidney Stones",:meddata => "0,0,0,0,0")
            redirect_to login_path() 
    end


end