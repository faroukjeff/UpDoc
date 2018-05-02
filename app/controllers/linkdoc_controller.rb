class LinkdocController < ApplicationController

    def link_params
          params.require(:session).permit(:doc, :pat)
    end
    
    def link
        id = params[:session]
        @doc = id["doc"]
        @pat = id["pat"]
        patient = Profile.find_by(username: @pat)
        if patient
            patient.update(docid: @doc)
            redirect_to admin_admin_path
        else
            flash.alert = "Invalid entry"
            redirect_to admin_linkdoc_path
        end
        
        
    end

end