FactoryBot.define do
  factory :collection_area do
    name  { CollectionArea::TYPES[rand(0..11)] }    
  end
end
