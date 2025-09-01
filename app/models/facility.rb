class Facility < ApplicationRecord
  has_many :park_facilities, dependent: :destroy
  has_many :parks, through: :park_facilities

  validates :name, presence: true,uniqueness: true
end
