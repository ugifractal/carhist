class DeviceLog < ApplicationRecord
  belongs_to :device_logger, foreign_key: :device_logger_id
end
