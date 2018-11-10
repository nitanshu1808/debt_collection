class CreateDebtors < ActiveRecord::Migration[5.2]
  def change
    create_table :debtors do |t|
      t.string    	:county,    null: false
      t.string    	:name,        null: false
      t.string    	:address,     null: false
      t.string    	:city,        null: false
      t.string    	:postal_code, null: false
      t.references  :claim,       null: false
      t.timestamps
    end
  end
end
