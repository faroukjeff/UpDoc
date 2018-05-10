require 'rails_helper'

#{:name=> 'Jeff PHY', :pnumber=> '607345582', :city=> 'Vestal', :street=> 'East drive', :hnumber=> 46},

RSpec.describe Pharmacy, :type => :model do
  subject { described_class.new }
  
  it "is valid with valid attributes" do
    subject.name = 'Jeff PHY'
    subject.pnumber = '607345582'
    subject.city = 'Binghamton'
    subject.street = 'Riverside Drive'
    subject.hnumber = 66
    expect(subject).to be_valid
  end  
  it "is not valid without a name" do
    hos = Pharmacy.new(name: nil)
    expect(hos).to_not be_valid
  end
  it "is not valid without a pnumber" do
     hos = Pharmacy.new(pnumber: nil)
    expect(hos).to_not be_valid
  end  
  it "is not valid without a city" do
      hos = Pharmacy.new(city: nil)
    expect(hos).to_not be_valid
  end  
  it "is not valid without a street" do
     hos = Pharmacy.new(street: nil)
    expect(hos).to_not be_valid
  end  
  it "is not valid without a hnumber" do
     hos = Hospital.new(hnumber: nil)
    expect(hos).to_not be_valid
  end  
end

