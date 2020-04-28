require 'rails_helper'

RSpec.describe User, type: :model do

	let(:user) { User.new(email: 'test@test.com', encrypted_password: '123456abcdef', role: '')}

	# properties / attributes
	describe "attributes" do
		it "has an email" do
			expect(user).to respond_to(:email)
		end

		it "has a password" do
			expect(user).to respond_to(:password)
		end

		it "has a role" do
			expect(user).to respond_to(:role)
		end
	end

	# relationships
	describe "relationships" do
		it "belongs to organization" do
			expect(user).to belong_to(:organization)
		end		
	end

	# validations
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

	# methods
	describe "methods" do
		it "assigns role organization to user" do
			fake_user = User.new
			fake_user.set_default_role
			expect(fake_user.role).to eq(:organization)
		end
	end

end
