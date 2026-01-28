class HistoryImage < ApplicationRecord
  include ImageUploader::Attachment(:image)

  belongs_to :car_maintenance
  has_one_attached :image

  def generate_shared_link!
    update!(token: SecureRandom.hex(5))
  end

  def delete_shared_link!
    update!(token: nil)
  end
end
