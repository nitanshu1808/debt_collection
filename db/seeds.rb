CollectionArea.create(CollectionArea::TYPES.map{|collection_area| {name: collection_area} })
lawyer   = FactoryBot.create_list(:lawyer_with_associations, 20)
business = FactoryBot.create_list(:business_with_associations, 20)
