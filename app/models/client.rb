class Client < ApplicationRecord
  has_and_belongs_to_many :organizations

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
