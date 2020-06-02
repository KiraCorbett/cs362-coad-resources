FactoryBot.define do
  factory :organization do
    sequence :name do |n|
      "FAKE #{n}"
    end

    status {:approved}
    phone {'15416893012'}
    email {'test@test.com'}
    primary_name {'FAKENAME'}
    secondary_name {'FAKENAME'}
    secondary_phone {'15416893013'}

    trait :submitted do
      status { :submitted }
    end

    trait :approved do
      status { :approved }
    end
  end
end
