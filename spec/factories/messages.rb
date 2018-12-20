FactoryBot.define do
  factory :message do
    association :conversation
    association :user
    body      { FFaker::CheesyLingo.sentence }
  end
end
