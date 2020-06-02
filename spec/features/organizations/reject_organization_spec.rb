require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do

  let(:organization) { create(:organization, :submitted) }
  let(:admin) { create(:user, :admin) }

  before :each do
    admin.confirm
    log_in_as(admin)
  end

  context 'as an admin' do
    it 'rejects a pending organization' do
      visit organizations_path(organization)
      click_on 'Reject'
      click_on 'Rejected'
      expect(page).to have_content('Organizations')
      expect(page).to have_text("#{organization.name}")
    end
  end
end
