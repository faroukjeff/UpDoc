require 'rails_helper'


RSpec.describe MedicalRecord, :type => :model do
  subject { described_class.new }
  
  it "is valid with valid attributes" do
    subject.pnumber = 'P0898752'
    subject.name = 'Ramesh Kale'
    subject.address = 'Binghamton'
    subject.healthcare = 'Geo'
    subject.medhistory = 'High BP'
    subject.meddata = '{0,0,0,0,0}'
    expect(subject).to be_valid
  end  
  it "is not valid without a pnumber" do
    medrec = MedicalRecord.new(pnumber: nil)
    expect(medrec).to_not be_valid
  end
  it "is not valid without a name" do
     medrec = MedicalRecord.new(name: nil)
    expect(medrec).to_not be_valid
  end  
  it "is not valid without a address" do
      medrec = MedicalRecord.new(address: nil)
    expect(medrec).to_not be_valid
  end  
  it "is not valid without a healthcare" do
     medrec = MedicalRecord.new(healthcare: nil)
    expect(medrec).to_not be_valid
  end  
  it "is not valid without a medhistory" do
     medrec = MedicalRecord.new(medhistory: nil)
    expect(medrec).to_not be_valid
  end  
   it "is not valid without a meddata" do
     medrec = MedicalRecord.new(meddata: nil)
    expect(medrec).to_not be_valid
  end
end

