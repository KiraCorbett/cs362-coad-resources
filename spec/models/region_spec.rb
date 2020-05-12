require 'rails_helper'

RSpec.describe Region, type: :model do

  let(:region) { Region.new }

  describe "attributes" do
    it "has a name" do
      expect(Region).to respond_to(:name)
    end
  end

  describe "relationships" do
    it "has many tickets" do
      expect(region).to have_many(:tickets)
    end
  end

  describe "validations" do
    
    it "is a valid name" do
      expect(region).to validate_presence_of(:name)
    end

    it "is a valid length name" do
      expect(region).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end

    it "is unique name" do
      expect(region).to validate_uniqueness_of(:name).ignoring_case_sensitivity
    end

  end

  describe "::unspecified" do
    
    it "creates a new Unspecified resource category when one does not exist" do
      expect(Region.where(name: 'Unspecified')).to be_empty
      expect{ Region.unspecified }.to change { Region.count }.by(1)
    end

    it "does not create a new Unspecified resource category when one already exists" do
      create(:region, :unspecified)
      expect{ Region.unspecified }.to_not change { Region.count }
    end

    it "returns a resource category with the name unspecified" do
      expect(Region.unspecified.name).to eq('Unspecified')
    end

  end

  describe "#to_s" do
    it "has a string with a name" do
      region.name = 'FAKE'
      expect(region.to_s).to eq('FAKE')
    end
  end

end
