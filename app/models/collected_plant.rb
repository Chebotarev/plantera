class CollectedPlant < ApplicationRecord
  belongs_to :species, class_name: 'PlantSpecies', inverse_of: :collected_plants
  belongs_to :owner, class_name: 'User', inverse_of: :collected_plants

  def name
    if nick_name
      return "#{nick_name} - #{species.name}"
    end

    species.name
  end
end
