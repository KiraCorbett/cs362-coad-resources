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

		it "is a valid password length" do
			expect(user).to validate_length_of(:password).is_at_least(7).is_at_most(255)
		end

		# see user.rb for these validations that need to be tested
		# validates_length_of :email, minimum: 1, maximum: 255, on: :create
		# validates :email, format: { with: VALID_EMAIL_REGEX }
		# validates_uniqueness_of :email, case_sensitive: false
		# validates_presence_of :password, on: :create
		# validates_length_of :password, minimum: 7, maximum: 255, on: :create
	end

	# methods

end
