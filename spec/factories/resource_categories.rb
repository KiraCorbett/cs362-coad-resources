FactoryBot.define do
	factory :resource_category do
		name {'FAKE'}

		trait :unspecified do
    		name { 'Unspecified' }
		end

		# scope traits
		trait :active_resource_category do
			active { true }
		end
	end
end