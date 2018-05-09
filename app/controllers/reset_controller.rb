class ResetController < ApplicationController
    
    def reset_params
          params.require(:session).permit(:ver)
    end
    
    def reset
        id = params[:session]
        @ans = id["ver"]
        @av='A'
        if(@ans.downcase == "y")
            Appointment.update_all(:pid=> nil, :av=> 'A')
            flash[:notice] = "Reset Done!"
            redirect_to admin_admin_path()
        else
            flash[:notice] = "Reset Aborted!"
            redirect_to admin_admin_path()
        end
        
    end
end