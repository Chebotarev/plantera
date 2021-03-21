class CollectedPlant < ApplicationRecord
  belongs_to :species, class_name: 'PlantSpecies', inverse_of: :collected_plants
  belongs_to :owner, class_name: 'User', inverse_of: :collected_plants

  def name
    "#{nick_name.presence || '[UNNAMED]'} - #{species.name}"
  end

  def next_water_time
    return if last_time_watered.nil?

    last_time_watered + species.watering_interval.days
  end

  def needs_water?
    return false if last_time_watered.nil?
    return true if next_water_time < Time.current

    false
  end
end
