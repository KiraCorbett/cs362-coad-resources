require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do

  let(:user) { create(:user) }

  before do
    log_in_as(user)
  end

  context 'organization application' do
    it 'submits a successful application' do
      create(:user, :admin)
      visit new_organization_application_path
      choose "organization_liability_insurance_true"
      choose "organization_agreement_one_true"
      choose "organization_agreement_two_true"
      choose "organization_agreement_three_true"
      choose "organization_agreement_four_true"
      choose "organization_agreement_five_true"
      choose "organization_agreement_six_true"
      choose "organization_agreement_seven_true"
      choose "organization_agreement_eight_true"
      fill_in 'organization_primary_name', with: 'FAKE'
      fill_in 'organization_name', with: 'FAKE'
      fill_in 'organization_title', with: 'FAKE'
      fill_in 'organization_phone', with: '5556788765'
      fill_in 'organization_secondary_name', with: 'FAKE'
      fill_in 'organization_secondary_phone', with: '5556788765'
      fill_in 'organization_email', with: 'test@test.com'
      fill_in 'organization_description', with: 'FAKE APPLICATION DESCRIPTION'
      choose "organization_transportation_yes"
      click_on "Apply"
      expect(page).to have_text("Application Submitted")
    end

    it 'submits an incorrect application' do
      create(:user, :admin)
      visit new_organization_application_path
      choose "organization_liability_insurance_true"
      choose "organization_agreement_one_true"
      choose "organization_agreement_two_true"
      choose "organization_agreement_three_true"
      choose "organization_agreement_four_true"
      choose "organization_agreement_five_true"
      choose "organization_agreement_six_true"
      choose "organization_agreement_seven_true"
      choose "organization_agreement_eight_true"
      fill_in 'organization_primary_name', with: ''
      fill_in 'organization_name', with: ''
      fill_in 'organization_title', with: ''
      fill_in 'organization_phone', with: '5556788765'
      fill_in 'organization_secondary_name', with: 'FAKE'
      fill_in 'organization_secondary_phone', with: '5556788765'
      fill_in 'organization_email', with: 'test@test.com'
      fill_in 'organization_description', with: 'FAKE APPLICATION DESCRIPTION'
      choose "organization_transportation_yes"
      click_on "Apply"
      expect(page).to have_text("Name can't be blank")
    end
  end
end
