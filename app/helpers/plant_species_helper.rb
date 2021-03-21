module PlantSpeciesHelper
    def light_level_select_options
        PlantSpecies.light_levels.map { |light_level, _| [light_level.titleize, light_level] }
    end
end
