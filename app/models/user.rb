class User < ApplicationRecord
  include ImageUploader::Attachment(:image)
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :car_shops
  has_one :setting, dependent: :destroy
  belongs_to :company

  before_validation :assign_company, on: :create

  def assign_company
    new_company = Company.create!(name: email.split("@").first)
    self.company = new_company
  end
end
