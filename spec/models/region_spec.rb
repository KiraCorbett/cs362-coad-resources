require 'rails_helper'

RSpec.describe Region, type: :model do

		it "expect name responds to corresponding attribute" do
		expect(Region).to respond_to(:name)
	end

end
