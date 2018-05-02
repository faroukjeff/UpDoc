class SignupController < ApplicationController

def signup_params
      params.require(:session).permit(:firstname,:lastname,:email, :address, :insurance, :password, :confirmPassword)
end

def add
        id = params[:session]
        @fName = id["firstname"]
        @lName = id["lastname"]
        @em = id["email"]
        @addr = id["address"]
        @insur = id["insurance"]
        @passw = id["password"]
        @confirmpassw = id["confirmPassword"]
        
        isNull = true if(@fName == nil || @lName == nil || @em == nil || @addr == nil || @insur == nil || @passw == nil || @confirmpassw == nil)
        
        flash[:notice] = "Passwords don't match" if(@passw != @confirmpassw)
        flash[:notice] = "Fields cannot be null" if (isNull)
        
        Profile.create!(:username => @em, :first_name => @fName, :last_name_string => @lName, :address => @addr, :Healthcare => @insur, :password => @passw)
        Credential.create!(:username => @em, :password => @passw, :usertype => "P")

        redirect_to login_path() 
end


end