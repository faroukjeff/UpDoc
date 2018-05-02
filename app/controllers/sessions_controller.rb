class SessionsController < ApplicationController
  
  def session_params
    params.require(:session).permit(:username, :password,:usertype)
  end
  
  def new
  end
  
  def show
    id = params[:session]
    #password = params [:password]
    checkid = id["username"]
    password = id["password"]
    data = Credential.where(:username => checkid , :password => password)
    #byebug
    #p data
     
    if(checkid == "admin003@updoc.com" and password == "admintest7")
        redirect_to admin_admin_path
    
    else 
        if(data == [])
          flash[:notice] = "Wrong username/password"
          redirect_to login_path
        else
          data1 = data[0]
          if(data1["usertype"] == "D")
            redirect_to profile_doctorprofile_path(:params1=> data1["username"])      
          end
        end  
    end
  end
end