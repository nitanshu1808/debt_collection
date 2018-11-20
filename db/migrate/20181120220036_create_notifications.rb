class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.text        :notfication_message,    null: false, default: ""
      t.integer     :notifier_id,            null: false
      t.string      :notifier_type,          null: false
      t.boolean     :is_read,                null: false, default: false
      t.integer     :user_id,                null: false
      t.timestamps
    end
  end
end
