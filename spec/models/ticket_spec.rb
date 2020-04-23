require 'rails_helper'

RSpec.describe Ticket, type: :model do

	it "expect name responds to corresponding attribute" do
		expect(Ticket).to respond_to(:name)
	end

end
