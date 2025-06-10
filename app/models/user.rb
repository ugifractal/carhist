class User < ApplicationRecord
  include ImageUploader::Attachment(:image)
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :cars, dependent: :destroy
  has_many :car_shops
  has_one :api_key, dependent: :destroy
  has_one :setting, dependent: :destroy
end
