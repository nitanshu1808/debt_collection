class CreateClaims < ActiveRecord::Migration[5.2]
  def change
    create_table :claims do |t|
      t.integer     :business_id,           null: false
      t.references  :collection_area,       null: false
      t.float       :amount,                null: false
      t.string      :identifier,            null: false
      t.string      :additional_desciption, null: false
      t.integer     :status,                null: false, default: 0
      t.boolean     :is_rfp,                null: false, default: false
      t.string      :county,                null: false, default: ""
      t.datetime    :pending_since,         null: false
      t.boolean     :is_deleted,            null: false, default: false
      t.timestamps
    end
  end
end
