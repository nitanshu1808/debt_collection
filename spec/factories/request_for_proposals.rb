FactoryBot.define do
  factory :request_for_proposal do
    association :lawyer
    association :claim
  end
end
