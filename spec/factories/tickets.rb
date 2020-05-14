FactoryBot.define do
	factory :ticket do
		sequence :name do |n|
      "FAKE #{n}"
    end
    description {'FAKE'}
    phone {'15416893012'}
    region_id { create(:region).id }
    resource_category_id { create(:resource_category).id }

    trait :id do
      id{1}
    end

    trait :organization do
      organization
    end

    # scope traits
    trait :open_ticket do
  		closed { false }
  	end

    trait :closed_ticket do
      closed { true }
    end

	end
end