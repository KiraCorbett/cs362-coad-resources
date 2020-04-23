require 'rails_helper'

RSpec.describe User, type: :model do

	it "expect name responds to corresponding attribute" do
		expect(User).to respond_to(:name)
	end

end
