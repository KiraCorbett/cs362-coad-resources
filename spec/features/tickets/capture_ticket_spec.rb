require 'rails_helper'

RSpec.describe 'Capturing a ticket', type: :feature do
	let(:organization) { create(:organization, :approved) }
	let(:user) { create(:user, organization: organization) }
	let(:ticket) { create(:ticket) }

	context "As an approved organization user" do
		it "captures a ticket successfully" do
			log_in_as(user)
			visit ticket_path(ticket.id)
			click_on "Capture"
			expect(current_path).to eq(dashboard_path)
		end
	end
end