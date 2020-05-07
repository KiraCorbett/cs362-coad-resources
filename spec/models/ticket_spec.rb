require 'rails_helper'

RSpec.describe Ticket, type: :model do

  let(:ticket) { build(:ticket) }

  describe "properties / attributes" do
    specify{ expect(ticket).to respond_to(:name) }
    specify{ expect(ticket).to respond_to(:description) }
    specify{ expect(ticket).to respond_to(:phone) }
    specify{ expect(ticket).to respond_to(:closed) }
    specify{ expect(ticket).to respond_to(:closed_at) }
  end

  describe "relationships" do

    it "belongs to region" do
      expect(ticket).to belong_to(:region)
    end

    it "belongs to resource category" do
      expect(ticket).to belong_to(:resource_category)
    end

    it "is optional for it to belong to organization" do
      expect(ticket).to belong_to(:organization).optional
    end

  end

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

  # Methods

  describe "#open?" do

    it "is not open if it is closed" do
    	closed_ticket = Ticket.new(closed: true)
      expect(closed_ticket.open?).to be_falsy
    end

    it "is open if it is not closed" do
      open_ticket = Ticket.new(closed: false)
      expect(open_ticket.open?).to be_truthy
    end

  end

  describe "#captured?" do
    skip "gets whether or not ticket's organization is present" do
    end
  end

  describe "to_s" do
    skip "has a string with an ID number" do
    end
  end

  describe "scopes" do
    describe "#open" do
      it "returns open tickets" do

        create(:region)
        create(:resource_category)
        # create(:ticket, closed: false)

        # open_tickets = Ticket.open
        # expect(open_tickets).to include(:ticket)
      end
    end
  end

end
