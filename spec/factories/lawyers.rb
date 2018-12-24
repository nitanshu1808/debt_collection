FactoryBot.define do
  factory :lawyer, class: Lawyer, parent: :user do

    factory :lawyer_with_associations do
      transient do
        record_count { 2 }
      end

      after(:create) do |lawyer, evaluator|
        create_list(:education,       evaluator.record_count, lawyer: lawyer)
        create_list(:work_experience, evaluator.record_count, lawyer: lawyer)
        create(:address, user: lawyer)
        lawyer.collection_areas << CollectionArea.last || create(:collection_area)
      end
    end
  end
end
