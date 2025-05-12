class MaintenanceSerializer
  include Alba::Resource

  attributes :id, :title, :maintenance_type
  attribute :car_maintenance_images do |r|
    r.history_images.map do |hi|
      {id: hi.id, image_url: hi.image.url}
    end
  end
end
