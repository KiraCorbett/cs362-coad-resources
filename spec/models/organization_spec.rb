require 'rails_helper'

RSpec.describe Organization, type: :model do

	it "expect name responds to corresponding attribute" do
		expect(Organization).to respond_to(:name)
	end

end
