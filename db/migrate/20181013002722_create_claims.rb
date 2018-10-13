class CreateClaims < ActiveRecord::Migration[5.2]
  def change
    create_table :claims do |t|
      t.integer     :business_id,     null: false
      t.references  :collection_area, null: false
      t.float       :amount,          null: false
      t.string      :claim_number,    null: false
      t.string      :additional_desciption, null: false
      t.datetime    :pending_since, null: false
      t.timestamps
    end
  end
end
