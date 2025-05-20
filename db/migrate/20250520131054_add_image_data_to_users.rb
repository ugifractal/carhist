class AddImageDataToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :image_data, :jsonb
  end
end
