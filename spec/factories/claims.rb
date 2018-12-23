FactoryBot.define do
  factory :claim do
    association :business
    association :collection_area
    amount                { 500 }
    additional_desciption { FFaker::Book.description }
    pending_since         { Time.now.utc - 3.days }
    county                { "Dublin" }
    status                { 1 }

    after(:create) do |claim, evaluator|
      create(:debtor, claim: claim)
    end
  end
end
