FactoryBot.define do
	factory :region do
		name {'FAKE'}
	end

	trait :unspecified do
      name { 'Unspecified' }
    end
end