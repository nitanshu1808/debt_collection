FactoryBot.define do
  factory :bid do
    association :lawyer
    association :claim
    amount                { FFaker::AddressCA.building_number }
    terms_of_service      { FFaker::Book.description }
  end
end
