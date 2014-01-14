require 'spec_helper'

describe Event do

  before { @event = Event.new(name: "NWOS Orchid Show", street_address: "123 A Street", city: "Seattle", state_province: "WA") }

  subject { @event }

  it { should respond_to(:name) }
  it { should respond_to(:city) }

  it { should be_valid }
  # it "should be valid" do
  #   expect(@event).to be_valid
  # end

  describe "when name is not present" do
    before { @event.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @event.name = "a" * 51 }
    it { should_not be_valid }
  end
end
