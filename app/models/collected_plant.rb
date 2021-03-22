class CollectedPlant < ApplicationRecord
  validate :last_time_watered_is_date
  belongs_to :species, class_name: 'PlantSpecies', inverse_of: :collected_plants
  belongs_to :owner, class_name: 'User', inverse_of: :collected_plants

  def name
    "#{nick_name.presence || '[UNNAMED]'} - #{species.name}"
  end

  def next_time_to_water
    return if last_time_watered.nil?

    last_time_watered + species.watering_interval.days
  end

  def hours_underwatered
    diff = (Time.current - next_time_to_water)
    (diff / 1.hour).round
  end

  def needs_water?
    return false if last_time_watered.nil?
    return true if last_time_watered > next_time_to_water

    false
  end

  def watering_status
    return :unknown if last_time_watered.nil?
    return :content if hours_underwatered.negative?
    return :wanting if hours_underwatered.between?(0, 48)

    :deprived
  end

  private

  def last_time_watered_is_date
    return if last_time_watered.nil?

    unless last_time_watered.is_a?(Time)
      errors.add(:last_time_watered, 'must be a valid date')
    end
  end
end
