class AddCarShopIdToCarMaintenances < ActiveRecord::Migration[8.0]
  def change
    add_column :car_maintenances, :car_shop_id, :integer
  end
end
