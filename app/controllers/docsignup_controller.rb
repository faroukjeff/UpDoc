class DocsignupController < ApplicationController

    def signup_params
          params.require(:session).permit(:firstname,:lastname,:email, :address, :pnumber, :password, :confirmPassword)
    end
    
    def add
            id = params[:session]
            @fName = id["firstname"]
            @lName = id["lastname"]
            @em = id["email"]
            @addr = id["address"]
            @docid = id["pnumber"]
            @passw = id["password"]
            @confirmpassw = id["confirmPassword"]
            
            isNull = true if(@fName == nil || @lName == nil || @em == nil || @addr == nil || @docid == nil || @passw == nil || @confirmpassw == nil)
            
            flash[:notice] = "Passwords don't match" if(@passw != @confirmpassw)
            flash[:notice] = "Fields cannot be null" if (isNull)
            
            Profile.create!(:username => @em, :first_name => @fName, :last_name_string => @lName, :address => @addr, :pnumber => @docid, :password => @passw)
            Credential.create!(:username => @em, :password=> @passw, :usertype=> 'D')
    
            redirect_to admin_admin_path()
    end
end