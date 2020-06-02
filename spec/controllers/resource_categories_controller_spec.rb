require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do
  let(:resource_category) { create(:resource_category) }

  before do
    resource_category
  end

  context 'As a non logged-in user' do
    describe 'GET #index' do
      specify { expect(get(:index)).to redirect_to(new_user_session_path) }
    end

    describe 'GET #new' do
      specify { expect(get(:new)).to redirect_to(new_user_session_path) }
    end

    describe 'GET #create' do
      specify { expect(get(:create, params: {:id => 1 })).to redirect_to(new_user_session_path) }
    end

    describe 'GET #update' do
      specify { expect(get(:update, params: {:id => 1 })).to redirect_to(new_user_session_path) }
    end

    describe 'GET #activate' do
      specify { expect(get(:activate, params: {:id => 1 })).to redirect_to(new_user_session_path) }
    end

    describe 'GET #deactivate' do
      specify { expect(get(:deactivate, params: {:id => 1 })).to redirect_to(new_user_session_path) }
    end

    describe 'GET #destroy' do
      specify { expect(get(:destroy, params: {:id => 1 })).to redirect_to(new_user_session_path) }
    end

  end
end