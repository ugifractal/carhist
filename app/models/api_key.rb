class ApiKey < ApplicationRecord
  belongs_to :user

  before_create :generate_api_key

  validates :user_id, uniqueness: true

  private

  def generate_api_key
    self.api_key = SecureRandom.hex(32)
  end
end