require 'rails_helper'

RSpec.describe 'Releasing a ticket by an', type: :feature do
	let(:organization) { create(:organization, :approved) }
	let(:user) { create(:user, organization: organization) }
	let(:ticket) { create(:ticket, organization: organization) }

	context "As an approved organization user" do
		it "releases a ticket successfully" do
			log_in_as(user)
			visit ticket_path(ticket.id)
			click_on "Release"
			expect(page).to have_content("Dashboard")
		end
	end
end
