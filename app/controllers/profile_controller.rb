class ProfileController < ApplicationController

def profile_params
    params.require(:session).permit(:username)
end

 def doctorprofile
   data = params[:params1]
   @user = Profile.where(:username => data)
   @data = Profile.where(:docid => data)
 end


end