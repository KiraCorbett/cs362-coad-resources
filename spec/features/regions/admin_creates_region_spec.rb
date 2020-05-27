require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do
	let(:admin) { create(:user, :admin) }

	before :each do
		admin.confirm
		log_in_as(admin)
	end

	context "as an admin" do
	    it "creates a region successfully" do
	      visit regions_path
	      click_on "Add Region"
	      fill_in "Name", with: "FAKE REGION"
	      click_on "Add Region"
	      expect(page).to have_content("FAKE REGION")
	    end

	    it "does not create a region successfully" do
	      visit regions_path
	      click_on "Add Region"
	      fill_in "Name", with: ""
	      click_on "Add Region"
	      expect(page).to have_content("Name can't be blank")
	    end
	end
end

