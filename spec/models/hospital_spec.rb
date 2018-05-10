require 'rails_helper'
=begin
RSpec.describe Hospital, :type => :model do
  it "is valid" do
    expect(Hospital.new).to be_valid
  end
end
=end



#{:name=> 'Lourd', :pnumber=> '6072386492', :city=> 'Binghamton', :street=> 'Riverside Drive', :hnumber=> 66}

RSpec.describe Hospital, :type => :model do
  subject { described_class.new }
  
  it "is valid with valid attributes" do
    subject.name = 'Lourd'
    subject.pnumber = '6072386492'
    subject.city = 'Binghamton'
    subject.street = 'Riverside Drive'
    subject.hnumber = 66
    expect(subject).to be_valid
  end  
  it "is not valid without a name" do
    hos = Hospital.new(name: nil)
    expect(hos).to_not be_valid
  end
  it "is not valid without a pnumber" do
     hos = Hospital.new(pnumber: nil)
    expect(hos).to_not be_valid
  end  
  it "is not valid without a city" do
      hos = Hospital.new(city: nil)
    expect(hos).to_not be_valid
  end  
  it "is not valid without a street" do
     hos = Hospital.new(street: nil)
    expect(hos).to_not be_valid
  end  
  it "is not valid without a hnumber" do
     hos = Hospital.new(hnumber: nil)
    expect(hos).to_not be_valid
  end  
end

