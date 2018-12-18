FactoryBot.define do
  factory :business, class: Business, parent: :user do
    after(:create) do |business, evaluator|
      create(:address, user: business)
    end
  end
end
