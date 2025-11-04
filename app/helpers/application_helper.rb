module ApplicationHelper
  def dashboard_page?
    controller_name == "dashboards"
  end

  def car_page?
    controller_name == "cars"
  end

  def car_shop_page?
    controller_name == "car_shops"
  end

  def active_car_page?(car_id)
    params[:car_id] == car_id.to_s
  end

  def format_date(time, tz = nil)
    return "" if time.nil?
    timezone = tz || @tz || "UTC"
    time.in_time_zone(tz).strftime("%d %b %Y")
  end

  def format_time(time, tz = nil)
    timezone = tz || @tz || "UTC"
    time.in_time_zone(tz).strftime("%d %b %Y %H:%M:%S")
  end
end
