require 'rails_helper'

RSpec.describe Region, type: :model do

	describe "attributes" do
		it "has a name" do
			expect(Region).to respond_to(:name)
		end
	end

end
