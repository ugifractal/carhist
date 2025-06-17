class CarMaintenanceSetting < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_settings do |t|
      t.integer :car_id
      t.integer :engine_oil_change_interval, default: 5000
      t.integer :engine_oil_change_time_interval, default: 6
      t.integer :transmission_oil_change_interval, default: 20000
      t.integer :transmission_oil_change_time_interval, default: 24

      t.timestamps
    end

    add_index :maintenance_settings, :car_id
    add_foreign_key :maintenance_settings, :cars
    end
  end
end
