require 'rails_helper'

RSpec.describe User, type: :model do

	let(:user) { User.new(email: 'test@test.com', encrypted_password: '123456abcdef', role: '')}

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

	describe "relationships" do

		it "belongs to organization" do
			expect(user).to belong_to(:organization)
		end		

	end

end
