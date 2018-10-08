class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.text        :name,                null: false, default: ""
      t.string      :city,                null: false, default: ""
      t.string      :postal_code,         null: false, default: ""
      t.string      :county,              null: false
      t.references  :user,                null: false
      t.timestamps
    end
  end
end
