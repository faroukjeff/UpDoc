class SessionsController < ApplicationController
  
  def session_params
    params.require(:session).permit(:username, :password)
  end
  
  def new
  end
  
  def show
    id = params[:session]
    #password = params [:password]
    checkid = id["username"]
    password = id["password"]
    @data = Credential.where(:username => checkid , :password => password)
    
    
    if(@data == [])
      flash[:notice] = "Wrong username/password"
      redirect_to login_path
    end  
    
  end
end
