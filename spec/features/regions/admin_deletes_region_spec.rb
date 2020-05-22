require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do
	let(:admin) do
		User.create(email: 'test@test.com', password: 'password',
					password_confirmation: 'password', role: 'admin')
	end

	before do
		admin.confirm
		log_in_as(admin)
	end

	context 'as an admin' do
		it 'deletes a region' do
			region = Region.create(name: 'Fake Region')
			visit region_path(region)
			click_on 'Delete'
			expect(page).to have_content('Regions')
			expect(page).to have_content('was deleted')
		end
	end

end
