class ChangeDeviceLoggersToUseInheritance < ActiveRecord::Migration[8.0]
  def change
    rename_column :device_loggers, :logger_type, :type
  end
end
