lawyer   = FactoryBot.create_list(:lawyer, 20)
business = FactoryBot.create_list(:business, 20)

collection_areas = ["Invoice", "Credit Card","Utility","Medical Bills",
                    "Construction","Student Loans","Loans", "Bad Checks",
                    "Vehicle Loans","Unpaid Rent", "Retail"]

CollectionArea.create(collection_areas.map{|collection_area| {name: collection_area} })
