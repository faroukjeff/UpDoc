class Profile < ActiveRecord::Base
    
    validates_presence_of :username
    validates_presence_of :first_name
    validates_presence_of :address
    validates_presence_of :pnumber
    validates_presence_of :password
end
