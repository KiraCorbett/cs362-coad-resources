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
      specify { expect(patch(:activate, params: {:id => 1 })).to redirect_to(new_user_session_path) }
    end

    describe 'GET #deactivate' do
      specify { expect(patch(:deactivate, params: {:id => 1 })).to redirect_to(new_user_session_path) }
    end

    describe 'GET #destroy' do
      specify { expect(get(:destroy, params: {:id => 1 })).to redirect_to(new_user_session_path) }
    end
  end

  context 'As an organization user' do
    let(:user) { create(:user) }
    let(:resource_category) { create(:resource_category) }

    before(:each) { sign_in(user) }

    specify 'GET #index' do
      expect(get(:index)).to redirect_to(dashboard_path) 
    end
    describe 'GET #new' do
      specify { expect(get(:new)).to redirect_to(dashboard_path)}
    end
    describe 'POST #create' do
      specify { expect(post(:create, params: {:id => 1 })).to redirect_to(dashboard_path) }
    end
    describe 'PUT #update' do
      specify { expect(put(:update, params: {:id => 1 })).to redirect_to(dashboard_path) }
    end
    describe 'PATCH #activate' do
      specify { expect(patch(:activate, params: {:id => 1 })).to redirect_to(dashboard_path) }
    end
    describe 'PATCH #deactivate' do
      specify { expect(patch(:deactivate, params: {:id => 1 })).to redirect_to(dashboard_path) }
    end
    describe 'DELETE #destroy' do
      specify { expect(delete(:destroy, params: {:id => 1 })).to redirect_to(dashboard_path) }
    end
  end

  context 'As an admin' do
    let(:admin_user) { create(:user, :admin) }
    let(:resource_category) { create(:resource_category) }
    let(:active_resource) { create(:resource_category, :active_resource_category) }
    let(:inactive_resource) { create(:resource_category, :inactive_resource_category) }

    before(:each) do
      sign_in(admin_user)
    end

    describe 'GET #index' do
      specify { expect(get(:index)).to be_successful }
    end
    describe 'GET #new' do
      specify { expect(get(:new)).to be_successful }
    end
    describe 'POST #create' do
      specify { expect(post(:create, params: {id: resource_category.id, resource_category: attributes_for(:resource_category)})).to be_successful }
    end
    describe 'PUT #update' do
      specify { expect(put(:update, params: {id: resource_category.id, resource_category: attributes_for(:resource_category)})).to redirect_to(resource_category_path(resource_category)) }
    end
    describe 'PATCH #activate' do
      specify { expect(patch(:activate, params: {id: resource_category.id})).to redirect_to(resource_category_path(resource_category)) }
    end
    describe 'PATCH #deactivate' do
      specify { expect(patch(:deactivate, params: {id: resource_category.id})).to redirect_to(resource_category_path(resource_category)) }
    end
    describe 'DELETE #destroy' do
      specify { expect(delete(:destroy, params: {id: resource_category.id})).to redirect_to(resource_categories_path) }
    end
  end
end