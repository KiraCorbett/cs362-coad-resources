FactoryBot.define do
	factory :ticket do
		sequence :name do |n|
      "FAKE #{n}"
    end
    description {'FAKE'}
    phone {'15416893012'}
    region
    resource_category
    #region { create(:region) }
    #resource_category{ create(:resource_category) }

    trait :open_ticket do
  		closed { false }
  	end
	end
end