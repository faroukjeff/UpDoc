class Credential < ActiveRecord::Base
    
    validates_presence_of :username
    validates_presence_of :password
    validates_presence_of :usertype
    
end
