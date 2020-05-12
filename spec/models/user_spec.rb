require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { User.new(email: 'test@test.com', encrypted_password: '123456abcdef', role: '')}

  describe "properties / attributes" do
    specify{ expect(user).to respond_to(:email) }
    specify{ expect(user).to respond_to(:role) }
  end

  describe "relationships" do
    it "belongs to organization" do
      expect(user).to belong_to(:organization).optional
    end    
  end

  describe "validations" do

    it "is valid with an email" do
      expect(user).to validate_presence_of(:email)
    end

    it "is a valid legnth of email" do
      expect(user).to validate_length_of(:email).is_at_least(1).is_at_most(255)
    end

    it "is a valid email format" do
      expect(user).to allow_value('test@test.com').for(:email)
    end

    it "is unique email" do
      expect(user).to validate_uniqueness_of(:email).ignoring_case_sensitivity
    end

    it "is valid with a password" do
      expect(user).to validate_presence_of(:password)
    end

    it "is a valid password length" do
      expect(user).to validate_length_of(:password).is_at_least(7).is_at_most(255)
    end

  end

  describe "#set_default_role" do

    it "assigns role organization to user" do
      user.set_default_role
      expect(user.role).to eq('organization')
    end

    it "does not change the role if the user already has one" do
      user.role = :admin
      user.set_default_role
      expect(user.role).to_not eq("organization")
    end

  end

  describe "#to_s" do
    it "has a string with an email" do
      expect(user.to_s).to eq("test@test.com")
    end
  end

end
