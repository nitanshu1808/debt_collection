class AddBidCountToClaim < ActiveRecord::Migration[5.2]
  def change
    add_column :claims, :bids_count, :integer, default: 0
  end
end
