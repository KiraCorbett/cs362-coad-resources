require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

	describe "attributes" do
		it "has a name" do
			expect(ResourceCategory).to respond_to(:name)
		end

		it "is active" do
			expect(ResourceCategory).to respond_to(:active)
		end
	end

end
