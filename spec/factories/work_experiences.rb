FactoryBot.define do
  factory :work_experience do
    association :lawyer
    company_name      {FFaker::CompanyIT.name}
    designation       {"Solicitor"}
    location          {FFaker::Address.city_suffix}
    from_date         {Time.now - 2.year}
    to_date           {from_date + 4.year}
    responsibilities  {FFaker::Book.description}
  end
end
