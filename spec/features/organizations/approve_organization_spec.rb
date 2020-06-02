require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do

  let(:organization) { create(:organization, :submitted) }
  let(:admin) { create(:user, :admin) }

  before :each do
    admin.confirm
    log_in_as(admin)
  end

  context 'approve an organization' do
    it 'displays pending organizations and approves' do
      visit organizations_path(organization) # /organizations/{#}
      click_on 'Approve'
      expect(page).to have_content('Approved')
    end

    it "cannot approve a non-pending organization" do
        visit organization_path(organization)
        expect(page).not_to have_link('Approved')
      end
  end
end
