FactoryGirl.define do
	factory :user do
		sequence(:email) { |n| "#{Faker::Name.first_name.downcase}-#{n}@domen.com" }
		first_name { Faker::Name.first_name }
		middle_name { Faker::Name.first_name }
		last_name { Faker::Name.last_name }
		password  'random_password'
    password_confirmation 'random_password'

    trait :admin do
    	roles { [create(:role, :admin)] }
    end
	end	
end