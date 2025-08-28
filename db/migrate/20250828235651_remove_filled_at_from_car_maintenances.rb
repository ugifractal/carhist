class RemoveFilledAtFromCarMaintenances < ActiveRecord::Migration[8.0]
  def change
    remove_column :car_maintenances, :filled_at, :datetime
  end
end
