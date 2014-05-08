# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Entry do
  before { @entry = FactoryGirl.create(:entry) }

  subject { @entry }

  it { should respond_to(:email) }
  it { should be_valid }

  describe "when email is not present" do
    before { @entry.email = "" }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user_at_foo,org example.user@foo.foo@bar_baz.com foo@bar+baz.com]                    
      addresses.each do |invalid_address|
        @entry.email = invalid_address
        should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @entry.email = valid_address
        should be_valid
      end
    end
  end
end
