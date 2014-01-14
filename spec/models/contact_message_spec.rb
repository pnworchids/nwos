require 'spec_helper'
require 'active_attr/rspec'

describe ContactMessage do

  before do
    @message = ContactMessage.new(name: "Alycia Moncrieff", from_email: "alycia@amoncrieff.com", to_email: "nwos@nwos.org", subject: "test subject", message: "This is a test message.")
  end

  it "should have a name of type string" do
    should have_attribute(:name).of_type(String)
  end

  describe "when sender email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @message.from_email = invalid_address
        expect(@message).not_to be_valid
      end
    end
  end

  describe "when sender email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @message.from_email = valid_address
        expect(@message).to be_valid
      end
    end
  end
end