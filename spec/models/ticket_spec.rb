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

    it "has a valid length of name" do
      expect(ticket).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end

    it "is valid with a phone" do
      expect(ticket).to validate_presence_of(:phone)
    end

    it "has a valid length of description" do
      expect(ticket).to validate_length_of(:description).is_at_most(1020).on(:create)
    end

    it "has a valid phone" do
      expect(ticket).to allow_value('15416893012').for(:phone)
      # check phony_plausible: true?
    end

    it "does not have an invalid phone" do
      expect(ticket).to_not allow_value('FAKE').for(:phone)
    end

  end

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

    let(:ticket_with_organization) { create(:ticket, :organization) }
    let(:ticket_without_organization) { create(:ticket) }

    it "is captured if organization is present" do
      expect(ticket_with_organization.captured?).to be_truthy
    end

    it "is not captured if organization is not present" do
      expect(ticket_without_organization.captured?).to be_falsy
    end
  end

  describe "to_s" do

    let(:ticket_with_id) { create(:ticket, :id) }
    it "has a string with an ID number" do
      expect(ticket_with_id.to_s).to eq("Ticket 1")
    end
  end

  describe "scopes" do

    let(:open_ticket) { create(:ticket, :open_ticket) }
    let(:closed_ticket) { create(:ticket, :closed_ticket) }
    let(:open_ticket_with_org) { create(:ticket, :open_ticket, :organization) }
    let(:open_ticket_without_org) { create(:ticket, :open_ticket) }
    let(:closed_ticket_with_org) { create(:ticket, :closed_ticket, :organization) }
    let(:closed_ticket_without_org) { create(:ticket, :closed_ticket) }
    let(:organization) { create(:organization) }

    describe "#open" do

      it "returns open tickets" do
        open_tickets = Ticket.open
        expect(open_tickets).to include(open_ticket)
      end

      it "does not return closed tickets" do
        open_tickets = Ticket.open
        expect(open_tickets).to_not include(closed_ticket)
      end

    end

    describe "#all_organization" do

      it "returns all open tickets with organizations" do
        organization_tickets = Ticket.all_organization
        expect(organization_tickets).to include(open_ticket_with_org)
      end

      it "does not return all open tickets without organizations" do
        organization_tickets = Ticket.all_organization
        expect(organization_tickets).to_not include(open_ticket_without_org)
      end

      it "does not return all closed tickets with organizations" do
        organization_tickets = Ticket.all_organization
        expect(organization_tickets).to_not include(closed_ticket_with_org)
      end

      it "does not return all open tickets without organizations" do
        organization_tickets = Ticket.all_organization
        expect(organization_tickets).to_not include(closed_ticket_without_org)
      end

    end

    describe "#organization" do

      it "returns open tickets with organization id" do
        org_id = open_ticket_with_org.organization.id
        organization_tickets = Ticket.organization(org_id)
        expect(organization_tickets).to include(open_ticket_with_org)
      end

      it "does not return closed tickets with organization id" do
        org_id = closed_ticket_with_org.organization.id
        organization_tickets = Ticket.organization(org_id)
        expect(organization_tickets).to_not include(closed_ticket_with_org)
      end

      it "does not return open tickets with a different organization" do
        org_id = organization.id
        organization_tickets = Ticket.organization(org_id)
        expect(organization_tickets).to_not include(open_ticket)
      end

      it "does not return closed tickets with a different organization" do
        org_id = organization.id
        organization_tickets = Ticket.organization(org_id)
        expect(organization_tickets).to_not include(closed_ticket)
      end

    end

    describe "#closed_organization" do

      it "returns closed tickets with organization id" do
        org_id = closed_ticket_with_org.organization.id
        organization_tickets = Ticket.closed_organization(org_id)
        expect(organization_tickets).to include(closed_ticket_with_org)
      end

      it "does not return open tickets with organization id" do
        org_id = open_ticket_with_org.organization.id
        organization_tickets = Ticket.closed_organization(org_id)
        expect(organization_tickets).to_not include(open_ticket_with_org)
      end

      it "does not return closed tickets with a different organization" do
        org_id = organization.id
        organization_tickets = Ticket.closed_organization(org_id)
        expect(organization_tickets).to_not include(closed_ticket)
      end

      it "does not return open tickets with a different organization" do
        org_id = organization.id
        organization_tickets = Ticket.closed_organization(org_id)
        expect(organization_tickets).to_not include(open_ticket)
      end

    end

    describe "#region" do

      it "returns open organization tickets with region id" do
        region_id = open_ticket_with_org.region_id
        region_tickets = Ticket.region(region_id)
        expect(region_tickets).to include(open_ticket_with_org)
      end

      it "returns closed organization tickets with region id" do
        region_id = closed_ticket_with_org.region_id
        region_tickets = Ticket.region(region_id)
        expect(region_tickets).to include(closed_ticket_with_org)
      end

      it "returns open tickets with region id" do
        region_id = open_ticket.region_id
        region_tickets = Ticket.region(region_id)
        expect(region_tickets).to include(open_ticket)
      end

      it "returns closed tickets with region id" do
        region_id = closed_ticket.region_id
        region_tickets = Ticket.region(region_id)
        expect(region_tickets).to include(closed_ticket)
      end

    end

    describe "#resource_category" do

      it "returns open organization tickets with resource category id" do
        resource_id = open_ticket_with_org.resource_category_id
        region_tickets = Ticket.resource_category(resource_id)
        expect(region_tickets).to include(open_ticket_with_org)
      end

      it "returns closed organization tickets with region id" do
        resource_id = closed_ticket_with_org.resource_category_id
        region_tickets = Ticket.resource_category(resource_id)
        expect(region_tickets).to include(closed_ticket_with_org)
      end

      it "returns open tickets with region id" do
        resource_id = open_ticket.resource_category_id
        region_tickets = Ticket.resource_category(resource_id)
        expect(region_tickets).to include(open_ticket)
      end

      it "returns closed tickets with region id" do
        resource_id = closed_ticket.resource_category_id
        region_tickets = Ticket.resource_category(resource_id)
        expect(region_tickets).to include(closed_ticket)
      end

    end

  end
end
