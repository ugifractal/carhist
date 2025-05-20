class AddImageDataToCars < ActiveRecord::Migration[8.0]
  def change
    add_column :cars, :image_data, :jsonb
  end
end
