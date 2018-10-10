FactoryBot.define do
  factory :education do
    association :lawyer
    field_of_study {FFaker::Education.degree}
    institution    {FFaker::Education.school}
    from_date      {Time.now - 2.year}
    to_date        {Time.now - 1.year}
  end
end
