class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :orders, dependent: :destroy
end