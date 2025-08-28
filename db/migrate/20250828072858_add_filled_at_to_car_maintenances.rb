class AddFilledAtToCarMaintenances < ActiveRecord::Migration[8.0]
  def change
    add_column :car_maintenances, :filled_at, :datetime
  end
end
