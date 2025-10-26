class CreateCarSellImages < ActiveRecord::Migration[8.0]
  def change
    create_table :car_sell_images do |t|
      t.integer :car_sell_id
      t.integer :position, default: 0
      t.jsonb :image_data
      t.timestamps
    end
  end
end
