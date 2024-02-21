FactoryBot.define do
  factory :user do
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    email { Faker::Internet.email }
    account_id { 1 }
  end

  factory :facility do
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    country { Faker::Address.country }
    description { Faker::Lorem.sentence }
    name { Faker::Company.name }
    phone_number { Faker::PhoneNumber.phone_number }
    postal_code { Faker::Address.postcode }
    province { Faker::Address.state }
    status { "active" }
    account_id { 1 }
  end
end
