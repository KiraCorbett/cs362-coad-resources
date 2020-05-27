require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do

	let(:admin) { create(:user, :admin) }
	let(:ticket) { create(:ticket, :id) }

	before :each do
		admin.confirm
		log_in_as(admin)
		ticket.id
	end

	context "as an admin" do
		it "deletes a ticket successfully" do
			visit ticket_path(ticket)
			click_on "Delete"
			expect(page).to have_content("was deleted")
		end
	end
end