class DeviceLogger < ApplicationRecord
  belongs_to :car
  before_create :generate_token

  private

  def generate_token
    self.token = SecureRandom.hex(20)
  end
end
