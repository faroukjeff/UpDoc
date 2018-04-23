class ProfileController < ApplicationController

def profile_params
    params.require(:session).permit(:username)
end

 def doctorprofile
   @data = params[:params1]
 end


end