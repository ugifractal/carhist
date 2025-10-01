class Company < ApplicationRecord
  has_many :car_shops, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cars, dependent: :destroy

  def pending_order
    orders.where(status: "pending").order(created_at: :desc).last
  end

  def can_add_car?
    (plan == "free" && cars.count < 2) || (plan == "paid" && @cars.count < 6)
  end
end
