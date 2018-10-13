class CreateRequestForProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :request_for_proposals do |t|
      t.integer     :lawyer_id,     null: false
      t.integer     :claim_id,      null: false
      t.boolean     :is_responded,  null: false, default: false
      t.timestamps
    end
  end
end
