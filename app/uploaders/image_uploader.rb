class ImageUploader < Shrine
  plugin :validation
  plugin :validation_helpers

  Attacher.validate do
    validate_max_size 20.megabytes

    if file.mime_type
      validate_mime_type %w[image/jpeg image/png]
    end
  end
end
