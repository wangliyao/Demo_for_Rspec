FactoryGirl.define do
  factory :user do
    name { Faker::PhoneNumber.phone_number }
    password { Faker::Name.last_name }
    sequence(:code) { |n| "2#{n}" }
  end
end
