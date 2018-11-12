FactoryBot.define do
  factory :bid do
    association :lawyer
    association :claim
    amount                { claim.amount/2 }
    terms_of_service      { FFaker::Book.description }
  end
end
