require 'rails_helper'

RSpec.describe Pharmacy, :type => :model do
  it "is valid" do
    expect(Pharmacy.new).to be_valid
  end
end