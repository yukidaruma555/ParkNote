class Equipment < ApplicationRecord

  has_many :park_equipments, dependent: :destroy
  has_many :parks, through: :park_equipments

  validates :name, presence: true, uniqueness: true
end
