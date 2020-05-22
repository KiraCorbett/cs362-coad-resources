require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do

	let(:organization) { create(:organization) }
	let(:user) { create(:user, :admin) }

	before do
		log_in_as(user)
	end

	context 'as an admin' do
		it 'displays an approve message' do
			visit organization_path(organization) # /organizations/{#}
			#click_on 'Approve'
			#expect(page).to have_content('Organization')
		end
	end
end

# Feature: Approving an Organization
# As an admin user,
# Given I am on the organizations screen (/organizations) and an organization exists,
# When I see that there is a pending organization,
# And I click the “Review” link,
# And I click the “Approve” link,
# Then I see that “approved.”
