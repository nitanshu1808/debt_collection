# frozen_string_literal: true
class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string      :email,               null: false, default: ""
      t.string      :encrypted_password,  null: false, default: ""
      t.string      :user_name,           null: false, default: ""
      t.string      :name,                null: false, default: ""
      t.string      :type,                null: false
      t.references  :employer,            index: true
      t.text        :description
      t.text        :address,             null: false, default: ""
      t.string      :city,                null: false, default: ""
      t.string      :postal_code,         null: false, default: ""
      t.string      :county,              null: false
      t.integer     :contact_number
      t.timestamps
    end

    add_index :users, :email,                unique: true
  end
end
