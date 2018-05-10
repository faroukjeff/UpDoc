require 'rails_helper'

RSpec.describe Appointment, :type => :model do
  subject { described_class.new }
  
  it "is valid with valid attributes" do
    subject.did = 'Aditya@bin.com'
    subject.slot = '9:00'
    subject.av = 'A'
    expect(subject).to be_valid
  end  
  it "is not valid without a doctor id" do
    appt = Appointment.new(did: nil)
    expect(appt).to_not be_valid
  end
  it "is not valid without a slot" do
     appt = Appointment.new(slot: nil)
    expect(appt).to_not be_valid
  end  
  it "is not valid without a availability" do
      appt = Appointment.new(av: nil)
    expect(appt).to_not be_valid
  end  
end

