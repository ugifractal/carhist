class CreateDeviceLoggers < ActiveRecord::Migration[8.0]
  def change
    create_table :device_loggers do |t|
      t.string :name, null: false
      t.string :logger_type
      t.string :status
      t.string :token
      t.integer :car_id
      t.timestamps
    end
  end
end
