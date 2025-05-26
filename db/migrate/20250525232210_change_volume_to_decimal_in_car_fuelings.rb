class ChangeVolumeToDecimalInCarFuelings < ActiveRecord::Migration[8.0]
  def change
    change_column :car_fuelings, :volume, :decimal, precision: 8, scale: 2
  end
end
