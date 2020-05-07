require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

  let (:resource_category) { ResourceCategory.new }

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
      expect(resource_category.deactivate).to eq(false)
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
	# describe "self unspecified" do
	# 	it "creates new Unspecified resource category" do
	# 		expect(resource_category).where(name: 'Unspecified').to be_empty
	# 	end

	# 	it "does not create a new Unspecified resource category when it exists" do
	# 		create(:resource_category, :unspecified)
	# 	end

	# 	it "returns unspecified resource category" do
 #      		expect(resource_category.unspecified.name).to eq('Unspecified')
 #    	end
	# end
end
