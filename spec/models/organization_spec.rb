require 'rails_helper'

RSpec.describe Organization, type: :model do

	let(:organization) { Organization.new()}

	# properties / attributes
	describe "attributes" do
		specify{ expect(organization).to respond_to(:name) }
		specify{ expect(organization).to respond_to(:status) }
		specify{ expect(organization).to respond_to(:phone) }
		specify{ expect(organization).to respond_to(:email) }
		specify{ expect(organization).to respond_to(:description) }
		specify{ expect(organization).to respond_to(:rejection_reason) }
		specify{ expect(organization).to respond_to(:liability_insurance) }
		specify{ expect(organization).to respond_to(:primary_name) }
		specify{ expect(organization).to respond_to(:secondary_name) }
		specify{ expect(organization).to respond_to(:secondary_phone) }
		specify{ expect(organization).to respond_to(:title) }
		specify{ expect(organization).to respond_to(:transportation) }
	end
end
