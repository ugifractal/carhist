class ImageUploader < Shrine
  plugin :validation
  plugin :validation_helpers
  plugin :derivatives

  Attacher.validate do
    validate_max_size 20.megabytes

    if file.mime_type
      validate_mime_type %w[image/jpeg image/png]
    end
  end

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)
    {
      thumb: magick.resize_to_fill!(300, 300),
      medium: magick.resize_to_limit!(800, 800),
    }
  end

  def generate_location(io, context)
    if context[:record].persisted? && context[:record].is_a?(CarSellImage)
      car = context[:record].car_sell.car
      ext = File.extname(context[:metadata]["filename"])

      name_without_ext = super(io)

      name_without_ext.gsub!(ext, "") if name_without_ext.ends_with?(ext)

      loc = if context[:derivative]
        "companies/#{car.company_id}/cars/#{car.id}/car_sell/#{context[:record].id}/#{name_without_ext}_#{context[:derivative]}#{ext}"
      else
        "companies/#{car.company_id}/cars/#{car.id}/car_sell/#{context[:record].id}/#{name_without_ext}#{ext}"
      end
      return loc
    end
    super(io)
  end
end
