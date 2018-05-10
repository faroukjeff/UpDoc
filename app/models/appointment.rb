class Appointment < ActiveRecord::Base
    validates_presence_of :did
    validates_presence_of :slot
    validates_presence_of :av
end
