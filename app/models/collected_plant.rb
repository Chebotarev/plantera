class CollectedPlant < ApplicationRecord
  belongs_to :species, class_name: 'PlantSpecies', inverse_of: :collected_plants
  belongs_to :owner, class_name: 'User', inverse_of: :collected_plants

  def name
    "#{nick_name.presence || '[UNNAMED]'} - #{species.name}"
  end

  # def next_water_time
  #   return if last_time_watered.nil?

  #   last_time_watered + species.watering_interval.days
  # end

  def needs_water?
    return false if last_time_watered.nil?
    return true if last_time_watered > species.watering_interval.days.ago

    false
  end

  def watering_status
    return :unknown if last_time_watered.nil?
    return :wanting if last_time_watered.between?(2.days.ago, Time.current)
    return :deprived if last_time_watered > 3.days.ago

    :content
  end
end
