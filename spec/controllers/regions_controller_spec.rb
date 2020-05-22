require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

	context 'As a non logged-in user' do
		# /regions
		describe 'GET #index' do
			specify { expect(get(:index)).to redirect_to(new_user_session_path)}
		end

		describe 'GET #new' do
			specify { expect(get(:new)).to redirect_to(new_user_session_path)}
		end

	end

    context 'As an organization user' do
        let(:user) { create(:user) }

        before do   
            sign_in(user)
        end

        specify 'GET #index' do
            expect(get(:new)).to redirect_to(dashboard_path) 
        end
        describe 'GET #new' do
			specify { expect(get(:new)).to redirect_to(dashboard_path)}
		end
    end

	context 'As an admin' do
		let(:admin_user) { create(:user, :admin) }
		let(:region) { create(:region) }
		before(:each) { sign_in(admin_user) }

		describe 'GET #index' do
			specify { expect(get(:index)).to be_successful }
		end
		describe 'GET #new' do
			specify { expect(get(:new)).to be_successful }
		end
		describe 'GET #edit' do
			specify { expect(get(:new, params: {id: region.id})).to be_successful }
		end
		describe 'GET #show' do
			specify { expect(get(:show, params: {id: region.id})).to be_successful }
		end
		describe 'POST #create' do
			specify { expect(post(:create, params: {id: region.id, region: attributes_for(:region)})).to be_successful }
		end
		describe 'PUT #update' do
			specify { expect(put(:update, params: {id: region.id, region: attributes_for(:region)})).to redirect_to(region_path(region)) }
		end
		describe 'DELETE #destroy' do
			specify { expect(delete(:destroy, params: {id: region.id})).to redirect_to(regions_path) }
		end

	end

end
