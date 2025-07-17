class Order < ApplicationRecord
  belongs_to :company

  before_validation :generate_name, on: :create

  ORDER_PRICE = 10_000

  def generate_name
    last_order = company.orders.order(order_number: :desc).last
    next_number = last_order.nil? ? 1 : (last_order.order_number + 1)
    self.order_number = next_number
  end
end
