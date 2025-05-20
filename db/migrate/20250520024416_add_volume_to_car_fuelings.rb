class AddVolumeToCarFuelings < ActiveRecord::Migration[8.0]
  def change
    add_column :car_fuelings, :volume, :integer
  end
end
