require 'rails_helper'

RSpec.describe Region, type: :model do

  let(:region) { Region.new }

  describe "attributes" do
    it "has a name" do
      expect(Region).to respond_to(:name)
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

end
