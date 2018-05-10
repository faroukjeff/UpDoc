class MedicalRecord < ActiveRecord::Base
    validates_presence_of :pnumber
    validates_presence_of :name
    validates_presence_of :address
    validates_presence_of :healthcare
    validates_presence_of :medhistory
    validates_presence_of :meddata
end
