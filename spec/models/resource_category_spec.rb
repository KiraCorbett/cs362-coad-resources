require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

  #let (:resource_category) { ResourceCategory.new }
  let(:resource_category) { build(:resource_category) }

  describe "properties / attributes" do
    specify{ expect(resource_category).to respond_to(:name) }
    specify{ expect(resource_category).to respond_to(:active) }
  end

  describe "relationships" do

    it "has an organization and belongs to many" do  
      expect(resource_category).to have_and_belong_to_many(:organizations)
    end

    it "has many tickets" do
      expect(resource_category).to have_many(:tickets)
    end

  end

  describe "validations" do

    it "is a valid name" do
      expect(resource_category).to validate_presence_of(:name)
    end

    it "is a valid name with valid length" do
      expect(resource_category).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end

    it "is a valid name with valid length" do
      expect(resource_category).to validate_uniqueness_of(:name).ignoring_case_sensitivity
    end

  end

  describe "::unspecified" do
    
    it "creates a new Unspecified resource category when one does not exist" do
      expect(ResourceCategory.where(name: 'Unspecified')).to be_empty
      expect{ ResourceCategory.unspecified }.to change { ResourceCategory.count }.by(1)
    end
    it "does not create a new Unspecified resource category when one already exists" do
      create(:resource_category, :unspecified)
      expect{ ResourceCategory.unspecified }.to_not change { ResourceCategory.count }
    end
    it "returns a resource category with the name unspecified" do
      expect(ResourceCategory.unspecified.name).to eq('Unspecified')
    end

  end

	describe "#activate" do

    it "updates to active" do
      resource_category.active = false
      resource_category.activate
      expect(resource_category.active).to eq(true)
    end

  end

  describe "#deactivate" do

    it "updates to deactive" do
      resource_category.active = true
      resource_category.deactivate
      expect(resource_category.active).to eq(false)
    end

  end

  describe "#inactive?" do

    it "is an inactive resource_category" do
      resource_category.active = true
      expect(resource_category.inactive?).to eq(false)
    end

    it "is an active resource_category" do
      resource_category.active = false
      expect(resource_category.inactive?).to eq(true)
    end

  end

  describe "#to_s" do
    it "has a string with a name" do
      resource_category.name = 'FAKE'
      expect(resource_category.to_s).to eq('FAKE')
    end
  end

  describe "scopes" do

    describe "#active" do
      
      let(:active_resource_category) { create(:resource_category, :active_resource_category) }
      #let(:inactive_resource_categories) { create(:resource_category, :inactive) }

      it "returns all active resource categories" do
        active_resource_categories = ResourceCategory.active
        expect(active_resource_categories).to include(active_resource_category)
      end

    #   it "returns all inactive resource categories" do
    #     inactive_resource_categories = ResourceCategory.inactive
    #     expect(inactive_resource_categories).not_to include(inactive_resource_categories)
    #   end

    end

  end

end
