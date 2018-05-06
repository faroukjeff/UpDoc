class ProfileController < ApplicationController

def profile_params
    params.require(:session).permit(:username)
end

 def patientprofile
   data = params[:params1]
   @user = Profile.where(:username => data)
 end

 def doctorprofile
   data = params[:params1]
   @user = Profile.where(:username => data)
   @data = Profile.where(:docid => data)
 end
 
 def medicalrecords
     id = params[:pnumber]
     
     @meddata = MedicalRecord.where(:pnumber=>id)
     @medrdata = @meddata[0].medhistory.split(",")
     @medcheckbox = @meddata[0].meddata.split(",")
     #p @medrdata
     #p @medcheckbox
 end    
 
 def searchpatients
 end     
     


end