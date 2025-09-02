class AgeGroup < ApplicationRecord
  has_many :park_age_groups, dependent: :destroy
  has_many :parks, through: :park_age_groups
  validates :name, presence: true, uniqueness: true
end
