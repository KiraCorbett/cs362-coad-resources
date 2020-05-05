require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

	let (:resource_category) { ResourceCategory.new }

	describe "attributes" do
		it "has a name" do
			expect(resource_category).to respond_to(:name)
		end

		it "is active" do
			expect(resource_category).to respond_to(:active)
		end
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

end
