module Device
  class HotswitchLog < DeviceLog
    belongs_to :hotswitch_logger, class_name: "Device::HotswitchLogger", foreign_key: :device_logger_id
  end
end
