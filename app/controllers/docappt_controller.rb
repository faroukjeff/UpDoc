class DocapptController < ApplicationController

    def signup_params
          params.require(:session).permit(:docid,:slot)
    end
    
    def add
            id = params[:session]
            @dmail = id["docid"]
            @tslot = id["slot"]
            
            isNull = true if(@dmail == nil || @tslot == nil)
            
            flash[:notice] = "Fields cannot be null" if (isNull)
            
            if Credential.where(:username => @dmail, :usertype => 'D').blank?
                flash[:notice] = "Doctor Does not exist"

            else
                Appointment.create!(:pid=> nil, :did=> @dmail, :slot=> @tslot, :av=> 'A')
                flash[:notice] = "Doctor Added To Appointment Table"
            end
            
            redirect_to admin_admin_path()
    end
    
end