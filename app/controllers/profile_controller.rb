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
   data = params[:docid]
   name = params[:data1]
    if(!(name.nil? || name.empty?))
        if(!(name["pname"].empty? || name["pname"].nil?))    
            
            first = name["pname"].split(" ");
            @user = Profile.where(:username => data)
            if first[1].nil?
                @data = Profile.where(:docid => data, :first_name => first[0])
            else
                @data = Profile.where(:docid => data, :first_name => first[0],:last_name_string => first[1])
            end 
            
            if @data.nil? || @data.empty?
                flash[:notice1] = "Patient not found"
            else
                flash[:notice1] = ""
            end
        else
            @user = Profile.where(:username => data)
            @data = Profile.where(:docid => data)
            flash[:notice1] = ""
        end   
    else
     @user = Profile.where(:username => data)
     @data = Profile.where(:docid => data)
    end    
 end     
 
 def myappt
   data = params[:docid]
   name = params[:data1]
   
   @data = Appointment.where(:did => data)
   @user = Profile.where(:username => data)
=begin    if(!(name.nil? || name.empty?))
        if(!(name["pname"].empty? || name["pname"].nil?))    
            
            first = name["pname"].split(" ");
            @user = Profile.where(:username => data)
            if first[1].nil?
                @data = Profile.where(:docid => data, :first_name => first[0])
            else
                @data = Profile.where(:docid => data, :first_name => first[0],:last_name_string => first[1])
            end 
            
            if @data.nil? || @data.empty?
                flash[:notice1] = "Patient not found"
            else
                flash[:notice1] = ""
            end
        else
            @user = Profile.where(:username => data)
            @data = Profile.where(:docid => data)
            flash[:notice1] = ""
        end   
    else
     @user = Profile.where(:username => data)
     @data = Profile.where(:docid => data)
    end  
=end
 end 
     


end