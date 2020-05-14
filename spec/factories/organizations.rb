FactoryBot.define do
	factory :organization do
		sequence :name do |n|
			"FAKE #{n}"
    	end
    
    	status {:approved}
	    phone {'15416893012'}
	    email {'test@test.com'}
	    primary_name {'FAKENAME'}
	    secondary_name {'FAKENAME2'}
	    secondary_phone {'15416893013'}
	end
end