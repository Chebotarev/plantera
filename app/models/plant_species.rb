# == Schema Information
#
# Table name: plant_species
#
#  id                :integer          not null, primary key
#  care_instructions :text
#  common_name       :string
#  light_level       :integer          not null
#  scientific_name   :string           not null
#  watering_interval :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_plant_species_on_common_name      (common_name)
#  index_plant_species_on_scientific_name  (scientific_name) UNIQUE
#
class PlantSpecies < ApplicationRecord
  validates :scientific_name, uniqueness: true, presence: true
  validates :light_level, presence: true
  validates :watering_interval, presence: true

  enum light_level: { low: 0, medium: 1, high: 2 }

  scope :with_scientific_name_like,
        ->(search_name) { where('LOWER(scientific_name) LIKE :search', search: "%#{search_name}%") }

  scope :with_common_name_like, ->(search_name) { where('LOWER(common_name) LIKE :search', search: "%#{search_name}%") }

  has_many :collected_plants, foreign_key: 'species_id', dependent: :destroy, inverse_of: :species
  has_many :comments, as: :commentable, dependent: :destroy

  def name
    return "#{common_name} (#{scientific_name})" if common_name

    scientific_name
  end
end
