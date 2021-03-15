# PlantSpecies represents a species of plant
class PlantSpecies < ApplicationRecord
  validates :scientific_name, uniqueness: true, presence: true
  validates :light_level, presence: true
  validates :watering_interval, presence: true

  enum light_level: { low: 0, medium: 1, high: 2 }
end
