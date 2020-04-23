require 'rails_helper'

RSpec.describe User, type: :model do

	let(:User) { User.new(email: 'test@test.com', encrypted_password: '123456abcdef', role: '')}

	describe "attributes" do
	
		it "has email" do
			User = User.new
			expect(User).to respond_to(:email)
		end

		it "has password" do
			expect(User).to respond_to(:password)
		end

		it "has role" do
			expect(User).to respond_to(:role)
		end
	end

end
