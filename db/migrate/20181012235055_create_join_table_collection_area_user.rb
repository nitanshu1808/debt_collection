class CreateJoinTableCollectionAreaUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :collection_areas, :users do |t|
    end
  end
end
