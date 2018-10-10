# frozen_string_literal: true
class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string      :email,               null: false, default: ""
      t.string      :encrypted_password,  null: false, default: ""
      t.string      :user_name,           null: false, default: ""
      t.string      :name,                null: false, default: ""
      t.string      :type
      t.references  :employer
      t.boolean     :profile_completed,   default: false
      t.text        :description
      t.integer     :contact_number
      t.timestamps
    end

    add_index :users, :email,                unique: true
  end
end
