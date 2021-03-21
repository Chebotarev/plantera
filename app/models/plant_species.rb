# PlantSpecies represents a species of plant
class PlantSpecies < ApplicationRecord
  validates :scientific_name, uniqueness: true, presence: true
  validates :light_level, presence: true
  validates :watering_interval, presence: true

  enum light_level: { low: 0, medium: 1, high: 2 }

  scope :with_scientific_name_like,
        ->(search_name) { where('LOWER(scientific_name) LIKE :search', search: "%#{search_name}%") }

  scope :with_common_name_like, ->(search_name) { where('LOWER(common_name) LIKE :search', search: "%#{search_name}%") }

  has_many :collected_plants, foreign_key: 'species_id'
end
