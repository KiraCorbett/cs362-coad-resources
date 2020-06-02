# require 'rails_helper'

# RSpec.describe 'Updating an organization', type: :feature do

# 	let(:organization) { create(:organization, :approved) }
# 	let(:admin) { create(:user, :admin) }

# 	before do
# 		create(:user, organization: organization) }
# 	end

# 	context "As an admin" do
# 		it "updates an organization profile" do
# 			log_in_as(admin)
# 			visit organization_path(organization)
# 			click_on("Edit", exact: true)
# 			fill_in "Name", with: "FAKE NAME"
# 			click_on "Save"
# 			expect(page).to have_content("FAKE NAME")
# 		end
# 	end
# end

# see class 18 for adding an edit feature