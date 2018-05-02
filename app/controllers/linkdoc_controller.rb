class LinkdocController < ApplicationController

    def link_params
          params.require(:session).permit(:docid, :patid)
    end
    
    def link
        id = params[:session]
        @docid = id["docid"]
        @patid = id["patid"]
        
        patient = Profile.find_by(username: @patid)
        patient.update(docid: @docid)
        redirect_to admin_admin_path
        
    end

end