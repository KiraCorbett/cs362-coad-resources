require 'rails_helper'

RSpec.describe Ticket, type: :model do

	let(:ticket) { Ticket.new }

	# properties / attributes
	describe "attributes" do
		specify{ expect(ticket).to respond_to(:name) }
		specify{ expect(ticket).to respond_to(:description) }
		specify{ expect(ticket).to respond_to(:phone) }
		specify{ expect(ticket).to respond_to(:closed) }
		specify{ expect(ticket).to respond_to(:closed_at) }
	end
end
