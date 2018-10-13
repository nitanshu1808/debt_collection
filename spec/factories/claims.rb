FactoryBot.define do
  factory :claim do
    association :business
    association :collection_area
    amount                { FFaker::AddressCA.building_number }
    identifier            { FFaker::AddressCA.building_number }
    additional_desciption { FFaker::Book.description }
    pending_since         { Time.now.utc - 3.days }
    county                { "Dublin" }
  end
end
