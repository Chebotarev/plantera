class PlantSpecies < ApplicationRecord
    validates :scientific_name, uniqueness: true, presence: true
    validates :light_level, presence: true
    validates :watering_interval, presence: true
end
