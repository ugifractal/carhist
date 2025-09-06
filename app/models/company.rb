class Company < ApplicationRecord
  has_many :car_shops, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cars, dependent: :destroy
  has_many :car_maintenances, through: :cars

  def pending_order
    orders.where(status: "pending").order(created_at: :desc).last
  end
end
