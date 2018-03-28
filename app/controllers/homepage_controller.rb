class HomepageController < ApplicationController
  def home
    @hospitals = Hospital.all
    @Pharmacys = Pharmacy.all
    refresh = params[:refresh]
    p# refresh
    puts "inside"
     if(refresh == 'refresh')
       puts "inside"
       redirect_to homepage_home_path()
     end
  end
  
  def index
    refresh = params[:refresh]
     if(refresh == 'refresh') 
       redirect_to :back
     end  
  end  
  
  def show
  end  
end