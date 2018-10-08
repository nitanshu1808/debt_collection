class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string      :provider_name,      null: false, default: ""
      t.string      :uid,                null: false, default: ""
      t.string      :token,              null: false, default: ""
      t.boolean     :expires,            null: false, default: false
      t.references  :user,               null: false
      t.timestamps
    end
  end
end
