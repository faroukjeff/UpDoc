require 'rails_helper'

RSpec.describe Profile, :type => :model do
  subject { described_class.new }
  
  it "is valid with valid attributes" do
    subject.username = 'Adimn@updoc.com'
    subject.first_name = 'Admin'
    subject.address = 'Riverside Drive'
    subject.pnumber = "NA"
    subject.password = "Admin119"
    expect(subject).to be_valid
  end  
  it "is not valid without a username" do
    hos = Profile.new(username: nil)
    expect(hos).to_not be_valid
  end
  it "is not valid without a first name" do
     hos = Profile.new(first_name: nil)
    expect(hos).to_not be_valid
  end  
  it "is not valid without a address" do
      hos = Profile.new(address: nil)
    expect(hos).to_not be_valid
  end  
  it "is not valid without a pnumber" do
     hos = Profile.new(pnumber: nil)
    expect(hos).to_not be_valid
  end  
  it "is not valid without a password" do
     hos = Profile.new(password: nil)
    expect(hos).to_not be_valid
  end  
end

