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

	# relationships
	describe "relationships" do
		it "belongs to region" do
			expect(ticket).to belong_to(:region)
		end

		it "belongs to resource category" do
			expect(ticket).to belong_to(:resource_category)
		end

		it "is optional for it to belong to organization" do
			expect(ticket).to belong_to(:organization) #.optional
		end
	end

	# validations
	describe "validations" do
		it "is valid with a name" do
			expect(ticket).to validate_presence_of(:name)
		end

		it "is a valid legnth of name" do
			expect(ticket).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
		end

		it "is valid with a phone" do
			expect(ticket).to validate_presence_of(:phone)
		end

		it "is a valid length of description" do
			expect(ticket).to validate_length_of(:description).is_at_most(1020).on(:create)
		end

		skip "is valid with a phone" do
			# Steps:
			#  1. Create valid ticket object with all attrs.
			#  2. Assert (expect) that it is valid.
			#  3. Change the phone number to something invalid. ("fake")
			#  4. Assert that it is invalid.
		end
	end

end
