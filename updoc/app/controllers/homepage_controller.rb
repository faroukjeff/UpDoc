class HomepageController < ApplicationController
  def home
    @hospitals = Hospital.all
    @Pharmacys = Pharmacy.all
  end
end