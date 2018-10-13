class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.integer         :lawyer_id,     null: false
      t.references      :claim,         null: false
      t.float           :amount,        null: false, default: 0
      t.integer         :status,        null: false, default: 0
      t.integer         :fee_type,      null: false, default: 0
      t.boolean         :is_deleted,    null: false, default: false
      t.string          :terms_of_service
      t.timestamps
    end
  end
end
