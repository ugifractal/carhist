class MaintenanceReport < ApplicationRecord
  include FileUploader::Attachment(:pdf)

  belongs_to :car
end
