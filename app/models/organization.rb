class Organization < ApplicationRecord
  has_many :clients_organizations
  has_many :clients, through: :clients_organizations
  has_many :equipments

  validates :title, :form_of_owership, :tax_number, :reg_number, presence: true
  validates :title, :tax_number, :reg_number, uniqueness: { case_sensitive: false }
  validates :tax_number, :reg_number, numericality: { only_integer: true }
  validates :tax_number, length: { is: 9 }
  validates :reg_number, length: { is: 13 }
end
