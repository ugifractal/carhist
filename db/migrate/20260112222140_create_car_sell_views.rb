class CreateCarSellViews < ActiveRecord::Migration[8.1]
  def change
    create_table :car_sell_views do |t|
      t.integer :car_sell_id
      t.string :ip_address
      t.string :country_code
      t.timestamps
    end
  end
end
