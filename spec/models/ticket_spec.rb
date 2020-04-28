require 'rails_helper'

RSpec.describe Ticket, type: :model do

	it "expect name responds to corresponding attribute" do
		expect(Ticket).to respond_to(:name)
	end

	# properties / attributes
	describe "attributes" do
		specify{ expect(ticket).to respond_to(:name) }
		specify{ expect(ticket).to respond_to(:description) }
		specify{ expect(ticket).to respond_to(:phone) }
		specify{ expect(ticket).to respond_to(:closed) }
		specify{ expect(ticket).to respond_to(:closed_at) }
	end

end
