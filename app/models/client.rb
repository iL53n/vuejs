class Client < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  validates :fullname, :email, :phone, presence: true
end
