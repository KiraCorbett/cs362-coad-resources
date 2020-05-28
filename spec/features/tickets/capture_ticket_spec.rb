# require 'rails_helper'

# RSpec.describe 'Capturing a ticket', type: :feature do
# 	let(:organization) { create(:organization, :approved) }
# 	let(:user) { create(:user, organization: organization) }
# 	let(:ticket) { create(:ticket, organization: user.organization) }

# 	context "As an approved organization user" do
# 		it "captures a ticket successfully" do
# 			log_in_as(user)
# 			visit ticket_path(ticket.id.captured?)
# 			click_on "Capture"
# 			expect(page).to have_content(ticket.page)
# 		end
# 	end
# end


# # - approved organization user
# # - organization user with approved
# # - ticket in system
# # - sign in as organization user
# # - click on a ticket 
# # - capture it