class CarMaintenance < ApplicationRecord
  MAINTENANCE_TYPES = [
    { name: "ac_repair", label: "AC Repair" },
    { name: "oil_change", label: "Oil Change" },
    { name: "tire_repair", label: "Tire Repair" },
    { name: "other", label: "Other" }
  ]
  belongs_to :car
  has_many :history_images, dependent: :destroy
  belongs_to :car_shop, optional: true
  validates :maintenance_type, :description, :title, presence: true

  def generate_shared_link!
    update!(token: SecureRandom.hex(5))
  end

  def delete_shared_link!
    update!(token: nil)
  end

  def self.apply_filter(keyword:, categories:)
    query = all
    query = query.where("LOWER(description) ILIKE :keyword OR LOWER(title) ILIKE :keyword", keyword: "%#{keyword.downcase}%") if keyword.present?
    query = query.where(maintenance_type: categories.split(",").map(&:strip)) if categories.present?
    query
  end

  def self.generate_pdf(keyword:, categories:)
    maintenances = apply_filter(keyword:, categories:).order(performed_at: :desc)
    return if maintenances.empty?

    car = maintenances.first.car

    document = Prawn::Document.new do |pdf|
      pdf.text "Maintenance Report for #{name} (#{car.car_model.car_brand.name})", size: 16, style: :bold
      pdf.move_down 10

      table_data = [ [ "Date", "Type", "Title", "Description" ] ]
      maintenances.each do |m|
        table_data << [
          m.performed_at&.strftime("%d %b %Y"),
          m.maintenance_type.humanize,
          m.title,
          m.description
        ]
      end
      pdf.table(table_data, header: true,
                            row_colors: %w[F0F0F0 FFFFFF],
                            cell_style: { borders: [] },
                            column_widths: [ 90, 100, 130, 220 ])
    end

    maintenance_report = car.maintenance_reports.new
    maintenance_report.pdf = StringIO.new(document.render)
    cached_file = maintenance_report.pdf
    cached_file.metadata["filename"] = "maintenance_report.pdf"
    cached_file.metadata["mime_type"] = "application/pdf"
    maintenance_report.pdf_data = cached_file.to_json
    maintenance_report.save!
  end
end
