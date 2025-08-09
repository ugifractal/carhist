class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cars, dependent: :destroy

  def pending_order
    orders.where(status: "pending").order(created_at: :desc).last
  end
end
