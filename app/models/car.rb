class Car < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :user
  belongs_to :car_model
  has_many :car_maintenances, dependent: :destroy
  has_many :car_fuelings, dependent: :destroy
  has_one :maintenance_setting, dependent: :destroy

  validates :name, presence: true

  def brand_name
    "#{car_model.car_brand.name} #{car_model.model} #{car_model.year}"
  end

  def generate_maintenance_pdf
    maintenances = car_maintenances.order(performed_at: :desc)

    Prawn::Document.new do |pdf|
      pdf.text "Maintenance Report for #{name} (#{car_model.car_brand.name})", size: 16, style: :bold
      pdf.move_down 10

      if maintenances.any?
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
      else
        pdf.text "No maintenance records found.", style: :italic
      end
    end.render
  end
end
