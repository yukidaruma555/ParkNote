class ParkAgeGroup < ApplicationRecord
  belongs_to :park
  belongs_to :age_group
end
