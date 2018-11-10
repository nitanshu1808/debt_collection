FactoryBot.define do
  factory :debtor do
    association :claim
    name           { FFaker::Name.html_safe_name }
    address        { FFaker::AddressUK.neighborhood }
    county         { FFaker::AddressUK.city }
    city           { FFaker::AddressUK.county }
    postal_code    { FFaker::AddressUS.zip_code}
  end
end
