class AddTitleToCarMaintenances < ActiveRecord::Migration[8.0]
  def change
    add_column :car_maintenances, :title, :string
  end
end
