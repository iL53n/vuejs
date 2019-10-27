class Organization < ApplicationRecord
  include PgSearch::Model

  has_many :clients_organizations, dependent: :destroy
  has_many :clients, through: :clients_organizations
  has_many :equipments

  validates :title, :form_of_owership, :tax_number, :reg_number, presence: true
  validates :title, :tax_number, :reg_number, uniqueness: { case_sensitive: false }
  validates :tax_number, :reg_number, numericality: { only_integer: true }
  validates :tax_number, length: { is: 9 }
  validates :reg_number, length: { is: 13 }

  pg_search_scope :search_by,
                  against: %i[title tax_number reg_number],
                  using: {
                    tsearch: { prefix: true }
                  }

  def self.search(query)
    return [] unless query
    search_by("#{query}")
  end
end
