class Client < ApplicationRecord
  has_many :clients_organizations, dependent: :destroy
  has_many :organizations, through: :clients_organizations

  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :validatable
  before_validation :set_password

  validates :fullname, :email, :phone, presence: true

  private

  def set_password
    self.password ||= SecureRandom.urlsafe_base64
  end
end
