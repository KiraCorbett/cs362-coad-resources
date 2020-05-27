require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do
	let(:user) { create(:user) }

	before do
		log_in_as(user)
	end

	context "As an approved organization user" do
		it "successfully creates a ticket" do 
			visit new_ticket_path
			fill_in "ticket_name", with: 'FAKE'
			fill_in "ticket_phone", with: '15416893012'
			select 'Select', from: 'ticket_region_id'
			select 'Select', from: 'ticket_resource_category_id'
			fill_in "ticket_description", with: 'Fake description'
			click_on "Send this help request"
			visit ticket_submitted_path
			expect(page).to have_text("Ticket Submitted")
		end

		it "does not successfully create a ticket" do 
			visit new_ticket_path
			fill_in "ticket_name", with: ''
			fill_in "ticket_phone", with: '15416893012'
			select 'Select', from: 'ticket_region_id'
			select 'Select', from: 'ticket_resource_category_id'
			fill_in "ticket_description", with: 'Fake description'
			click_on "Send this help request"
			expect(page).not_to have_text("Ticket Submitted")
		end
	end
end

     #create(:user, :admin)