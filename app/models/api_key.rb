class ApiKey < ApplicationRecord
  belongs_to :company

  before_create :generate_api_key

  validates :company_id, uniqueness: true

  private

  def generate_api_key
    self.api_key = SecureRandom.hex(32)
  end
end
