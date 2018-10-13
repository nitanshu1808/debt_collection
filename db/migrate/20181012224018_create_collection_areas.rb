class CreateCollectionAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :collection_areas do |t|
      t.string      :name, null: false, default: false
      t.timestamps
    end
  end
end
