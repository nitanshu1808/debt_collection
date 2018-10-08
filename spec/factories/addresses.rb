FactoryBot.define do
  factory :address do
    association :user
    name           { FFaker::AddressUK.neighborhood }
    county         { FFaker::AddressUK.city }
    city           { FFaker::AddressUK.county }
    postal_code    { FFaker::AddressUS.zip_code}
  end
end
