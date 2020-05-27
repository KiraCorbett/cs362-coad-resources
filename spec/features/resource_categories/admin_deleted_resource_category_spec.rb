require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do

	let(:admin) { create(:user, :admin) }
	let(:resource) { create(:resource_category)}

	before :each do
		resource
		admin.confirm
		log_in_as(admin)
	end

	context "as an admin" do
	    it "deletes a resource category successfully" do
	    	resource = ResourceCategory.create(name: 'Fake Resource')
	    	visit resource_category_path(resource)
	    	click_link "Delete"
	    	# page.accept_prompt(with: "Are you sure?") do
	    	# 	page.click_button "Ok"
	    	# end
	    	expect(page).to have_content("Resource Categories")
	    	expect(page).to have_content("was deleted")
	    end
	end
end