class RemoveFuelRangeFromCarFuelings < ActiveRecord::Migration[8.0]
  def change
    remove_column :car_fuelings, :fuel_range
    rename_column :car_fuelings, :km, :distance
  end
end
