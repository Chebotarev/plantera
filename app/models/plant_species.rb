# PlantSpecies represents a species of plant
class PlantSpecies < ApplicationRecord
  validates :scientific_name, uniqueness: true, presence: true
  validates :light_level, presence: true
  validates :watering_interval, presence: true

  enum light_level: { low: 0, medium: 1, high: 2 }
  before_destroy :prevent_destroy

  private
  def prevent_destroy
    errors.add(:base, message: "Don't do that")
    throw(:abort)
  end
end
