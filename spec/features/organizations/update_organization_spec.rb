require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do


	let(:organization) { create(:organization) }

	context "As an admin" do
		it "updating an organization successfully" do
			visit edit_organization_path(organization)
		end
	end
end
