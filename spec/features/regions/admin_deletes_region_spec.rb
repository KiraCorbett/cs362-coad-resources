require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do
  let(:admin) { create(:user, :admin) }

  before :each do
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
