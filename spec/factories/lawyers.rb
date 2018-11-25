FactoryBot.define do
  factory :lawyer, class: Lawyer, parent: :user do
  end

  # after(:create) do |lawyer, evaluator|
  #   lawyer.educations << build_list(:education, 2, lawyer: lawyer)
  #   lawyer.work_experiences << build_list(:work_experience, 2, lawyer: lawyer)
  # end

end
