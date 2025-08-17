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
end
