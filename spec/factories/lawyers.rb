FactoryBot.define do
  factory :lawyer, parent: :user do
    type { "Lawyer" }
  end
end
