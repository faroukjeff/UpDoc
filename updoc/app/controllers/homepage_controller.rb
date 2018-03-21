class HomepageController < ApplicationController
  def home
    @hospitals = Hospital.all
  end
end