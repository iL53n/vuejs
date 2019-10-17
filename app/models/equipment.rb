class Equipment < ApplicationRecord
  belongs_to :organization

  validates :title, :kind, :serial_number, presence: true
  validates :serial_number, uniqueness: true
end
