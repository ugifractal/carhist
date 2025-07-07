class AddLatAndLngToCarShop < ActiveRecord::Migration[8.0]
  def change
    add_column :car_shops, :lat, :string
    add_column :car_shops, :lng, :string
  end
end
