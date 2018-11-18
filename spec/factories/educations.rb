FactoryBot.define do
  factory :education do
    association :lawyer
    field_of_study {FFaker::Education.degree}
    institution    {FFaker::Education.school}
    from_date      {Time.now  - 2.year}
    to_date        {from_date + 2.year}
  end
end
