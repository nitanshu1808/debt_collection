FactoryBot.define do
  factory :user do
    email          { FFaker::Internet.email }
    user_name      { FFaker::Internet.user_name }
    name           { FFaker::Name.name }
    password       { email }
    contact_number { FFaker::PhoneNumberDA.mobile_phone_number}
    description    { FFaker::Book.title }
  end

  after(:create) do |user, evaluator|
    user.address ||= build(:address, :user => user)
  end
end
