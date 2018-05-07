class AppointmentController < ApplicationController
    
    def appointment
    @data = Appointment.where(:av => 'A')
    end
    
    def link_params
          params.require(:session).permit(:docid, :slot, :pname)
    end

    def confirm
        id = params[:session]
        @docid = id["docid"]
        @tslot = id["slot"]
        @name = id["pname"]
        if Appointment.find_by(did: @docid, slot: @tslot).blank?
            flash[:notice] = "Invalid Doctor or Time Slot"
        else
            appt = Appointment.find_by(did: @docid, slot: @tslot)
            appt.update(pid: @name, av: 'F')
            flash[:notice] = "Appointment Confirmed"
        end
        
        redirect_to login_path
        
    end
end
