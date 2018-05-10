require 'rails_helper'

RSpec.describe Credential, :type => :model do
  subject { described_class.new }
  
  it "is valid with valid attributes" do
    subject.username = 'Adimn@updoc.com'
    subject.password = 'Admin'
    subject.usertype = 'P'
    expect(subject).to be_valid
  end  
  it "is not valid without a username" do
    cred = Credential.new(username: nil)
    expect(cred).to_not be_valid
  end
  it "is not valid without a Password" do
     cred = Credential.new(password: nil)
    expect(cred).to_not be_valid
  end  
  it "is not valid without a usertype" do
      cred = Credential.new(usertype: nil)
    expect(cred).to_not be_valid
  end  
end

