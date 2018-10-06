FactoryBot.define do
  factory :lawyer do
    email          { FFaker::Internet.email }
    user_name      { FFaker::Internet.user_name }
    name           { FFaker::Name.name }
    password       { FFaker::Internet.email }
    address        { FFaker::AddressUK.neighborhood }
    county         { FFaker::AddressUK.city }
    city           { FFaker::AddressUK.county }
    contact_number { FFaker::PhoneNumberDA.mobile_phone_number}
    description    { FFaker::Book.title }
    postal_code    { FFaker::AddressUS.zip_code}
  end
end
