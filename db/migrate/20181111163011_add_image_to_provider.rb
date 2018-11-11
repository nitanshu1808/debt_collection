class AddImageToProvider < ActiveRecord::Migration[5.2]
  def change
    add_column :providers, :image_url, :string
  end
end
