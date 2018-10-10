class CreateWorkExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :work_experiences do |t|
    	t.integer   :lawyer_id, index: true, null: false
      t.string    :company_name, null: false
      t.string    :designation, null: false
      t.string    :location, null: false
      t.datetime  :from_date
      t.datetime  :to_date
      t.boolean   :currently_working
    	t.text 			:responsibilities
      t.timestamps
    end
  end
end
