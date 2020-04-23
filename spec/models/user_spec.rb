require 'rails_helper'

RSpec.describe User, type: :model do

	let(:user) { User.new(email: 'test@test.com', encrypted_password: '123456abcdef', role: '')}

	# properties / attributes
	describe "attributes" do
		it "has email" do
			expect(user).to respond_to(:email)
		end

		it "has password" do
			expect(user).to respond_to(:password)
		end

		it "has role" do
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
	end

	# methods

end
