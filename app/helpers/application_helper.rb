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
end
