class CreateDeviceLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :device_logs do |t|
      t.integer :device_logger_id
      t.string :type
      t.jsonb :raw, default: {}
      t.timestamps
    end
  end
end
