FactoryBot.define do
  factory :account do
    name { Faker::Company.name }
    subdomain { Faker::Internet.domain_word }
    domain { Faker::Internet.domain_name }
    status { "active" }
  end

  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    account_id { 1 }
  end

  factory :facility do
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    country { ["Canada", "United States"].sample }
    description { Faker::Lorem.sentence }
    name { Faker::Company.name }
    phone_number { Faker::PhoneNumber.phone_number }
    postal_code { Faker::Address.postcode }
    province { Faker::Address.state }
    status { ["active", "inactive"].sample }
    account_id { 1 }
  end

  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.phone_number }
    account_id { 1 }
  end

  factory :venue do
    name { Faker::Company.name }
    facility_id { 1 }
  end
end
