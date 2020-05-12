require 'rails_helper'

RSpec.describe Organization, type: :model do

  let(:organization) { Organization.new()}

  describe "properties / attributes" do
    specify{ expect(organization).to respond_to(:name) }
    specify{ expect(organization).to respond_to(:status) }
    specify{ expect(organization).to respond_to(:phone) }
    specify{ expect(organization).to respond_to(:email) }
    specify{ expect(organization).to respond_to(:description) }
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
 
    it "has a valid name" do
      expect(organization).to validate_presence_of(:name)
    end

    it "has a valid status" do
      expect(organization).to validate_presence_of(:status)
    end

    it "has a valid phone" do
      expect(organization).to validate_presence_of(:phone)
    end

    it "has a valid email" do
      expect(organization).to validate_presence_of(:email)
    end

    it "has a valid primary name" do
      expect(organization).to validate_presence_of(:primary_name)
    end

    it "has a valid secondary name" do
      expect(organization).to validate_presence_of(:secondary_name)
    end

    it "has a valid secondary phone" do
      expect(organization).to validate_presence_of(:secondary_phone)
    end
 
     it "has a valid name length" do
      expect(organization).to validate_length_of(:name).at_least(1).at_most(255).on(:create)
    end


  end

end
