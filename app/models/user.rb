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
  after_commit :send_signup_notification_after_confirm, on: :update

  def assign_company
    new_company = Company.create!(name: email.split("@").first)
    self.company = new_company
  end

  private

  def send_signup_notification_after_confirm
    return unless confirmed_at.present?

    return unless saved_change_to_confirmed_at?

    MailerUtil.with_admin_emails do |email|
      AdminMailer.with(user: User.last, email: email).notify_signup.deliver!
    end
  end
end
