require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

	it "expect name responds to corresponding attribute" do
		expect(ResourceCategory).to respond_to(:name)
	end

end
