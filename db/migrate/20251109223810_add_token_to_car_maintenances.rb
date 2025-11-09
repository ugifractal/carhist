class AddTokenToCarMaintenances < ActiveRecord::Migration[8.1]
  def change
    add_column :car_maintenances, :token, :string
  end
end
