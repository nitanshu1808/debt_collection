FactoryBot.define do
  factory :provider do
    association :user
    provider_name {"facebook"}
    uid           {SecureRandom.hex}
    expires       {Time.now + 1.day}
    token         {SecureRandom.hex}
  end
end
