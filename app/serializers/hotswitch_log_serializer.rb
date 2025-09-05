class HotswitchLogSerializer
  include Alba::Resource

  attributes :id, :created_at
  attribute :ect_voltage do |r|
    r.raw["ect_voltage"]
  end

  attribute :created_at_in_zone do |r|
    r.created_at.in_time_zone(@timezone)
  end

  def initialize(resource, timezone)
    super(resource)
    @timezone = timezone
  end
end
