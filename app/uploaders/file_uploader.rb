class FileUploader < Shrine
  plugin :validation
  plugin :validation_helpers

  Attacher.validate do
    validate_max_size 20.megabytes

    if file.mime_type
      validate_mime_type %w[application/pdf]
    end
  end

  def generate_location(io, metadata: {}, **options)
    record = options[:record]
    name = prepare_name(super, metadata)

    if record.persisted?
      if record.respond_to?(:car)
        return "#{record.car.company.id}/#{options[:record].class.name.split(":").last.underscore.pluralize}/#{record.id}/#{name}"
      end
      return "#{options[:record].class.name.split(":").last.underscore.pluralize}/#{record.id}/#{name}"
    end
    super
  end

  def prepare_name(generated_name, metadata)
    return generated_name if File.extname(generated_name).present?

    ext = case metadata["mime_type"]
    when "application/pdf"
      ".pdf"
    else
      nil
    end
    return "#{generated_name}#{ext}" if ext.present?

    "#{generated_name}#{File.extname(metadata["filename"].to_s)}"
  end
end
