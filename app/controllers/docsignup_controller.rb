class DocsignupController < ApplicationController

    def signup_params
          params.require(:session).permit(:first_name,:last_name_string,:username, :address, :pnumber, :password, :confirmPassword)
    end
    
    def add
            id = params[:session]
            @first_name = id["first_name"]
            @last_name_string = id["last_name_string"]
            @username = id["username"]
            @address = id["address"]
            @pnumber = id["pnumber"]
            @password = id["password"]
            @confirmPassword = id["confirmPassword"]
            
            isNull = true if(@first_name == nil || @last_name_string == nil || @username == nil || @address == nil || @pnumber == nil || @password == nil || @confirmPassword == nil)
            
            flash[:notice] = "Passwords don't match" and redirect_to admin_docsignup_path and return if(@password != @confirmPassword)
            flash[:notice] = "Fields cannot be null" and redirect_to admin_docsignup_path and return if (isNull)
            
            Profile.create!(:username => @username, :first_name => @first_name, :last_name_string => @last_name_string, :address => @address, :pnumber => @pnumber, :password => @password)
            Credential.create!(:username => @username, :password=> @password, :usertype=> 'D')
    
            redirect_to admin_admin_path()
    end
end