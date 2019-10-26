class Staff < ApplicationRecord
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :validatable
  before_validation :set_password

  private

  def set_password
    self.password ||= SecureRandom.urlsafe_base64
  end
end
