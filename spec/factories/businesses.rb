FactoryBot.define do
  factory :business, class: Business, parent: :user do

    factory :business_with_associations do
      transient do
        record_count { 3 }
      end

      after(:create) do |business, evaluator|
        create(:address, user: business)
        create_list(:claim,  evaluator.record_count, business: business, collection_area: CollectionArea.last)
      end
    end    
  end
end
