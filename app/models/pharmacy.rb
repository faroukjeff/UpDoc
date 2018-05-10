class Pharmacy < ActiveRecord::Base
    validates_presence_of :name
    validates_presence_of :pnumber
    validates_presence_of :city
    validates_presence_of :street
    validates_presence_of :hnumber
end
