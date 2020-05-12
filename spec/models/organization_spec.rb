require 'rails_helper'

RSpec.describe Organization, type: :model do

  let(:organization) { Organization.new()}

  describe "properties / attributes" do
    specify{ expect(organization).to respond_to(:name) }
    specify{ expect(organization).to respond_to(:status) }
    specify{ expect(organization).to respond_to(:phone) }
    specify{ expect(organization).to respond_to(:email) }
    #specify{ expect(organization).to respond_to(:description) }
    # specify{ expect(organization).to respond_to(:rejection_reason) }
    # specify{ expect(organization).to respond_to(:liability_insurance) }
    specify{ expect(organization).to respond_to(:primary_name) }
    specify{ expect(organization).to respond_to(:secondary_name) }
    specify{ expect(organization).to respond_to(:secondary_phone) }
    # specify{ expect(organization).to respond_to(:title) }
    # specify{ expect(organization).to respond_to(:transportation) }
  end

  describe "relationships" do

    it "has many users" do
      expect(organization).to have_many(:users)
    end

    it "has many tickets" do
      expect(organization).to have_many(:tickets)
    end

    it "has many and belongs to many resource categories" do
      expect(organization).to have_and_belong_to_many(:resource_categories)
    end

  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:primary_name) }
    it { should validate_presence_of(:secondary_name) }
    it { should validate_presence_of(:secondary_phone) }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it { should allow_value('test@test.com').for(:email) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
    it { should validate_length_of(:description).is_at_most(1020).on(:create) }
  end

  describe "#approve" do
    it "approves organization status to approve" do
      organization.approve
      expect(organization.status).to eq('approved')
    end
  end

  describe "#reject" do
    it "approves organization status to reject" do
      organization.reject
      expect(organization.status).to eq('rejected')
    end
  end

  describe "#set_default_status" do
    it "sets organization status to submitted" do
      organization.set_default_status
      expect(organization.status).to eq('submitted')
    end
  end

  describe "#set_default_status" do
    it "sets status to default status" do
      organization.status = nil
      organization.set_default_status
      expect(organization.status).to eq('submitted')
    end
  end

  describe "#to_s" do
    it "has a string with a name" do
      organization.name = 'FAKE'
      expect(organization.to_s).to eq('FAKE')
    end
  end

end
