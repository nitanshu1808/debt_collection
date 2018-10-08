FactoryBot.define do
  factory :business, parent: :user do
    type { "Business" }
  end
end
