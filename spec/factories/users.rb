FactoryBot.define do
	factory :user do
		sequence :email do |n|
	      "FAKE#{n}@test.com"
	    end

	    password {'123456abcdef'}

	    trait :admin do
	      role { 'admin' }
	    end
    	
    	after :create do |user|
    		user.confirm
    	end
	end
end