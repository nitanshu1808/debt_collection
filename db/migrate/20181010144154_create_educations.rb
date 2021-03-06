class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.integer   :lawyer_id,        null: false
      t.string    :field_of_study,   null: false
      t.string    :institution,      null: false
      t.datetime  :from_date
      t.datetime  :to_date
      t.timestamps
    end
  end
end
