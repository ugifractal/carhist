module Device
  class HotswitchLogger < DeviceLogger
    has_many :hotswitch_logs, class_name: "Device::HotswitchLog", foreign_key: :device_logger_id, dependent: :destroy
  end
end
