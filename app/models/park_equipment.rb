class ParkEquipment < ApplicationRecord
  belongs_to :park
  belongs_to :equipment
end
