module CollectedPlantsHelper
    def water_status_color(plant)
        return 'danger' if plant.last_time_watered.nil?
        plant.needs_water? ? 'warning' : 'success'
    end

    def last_watered_date_in_words(plant)
        return 'UNKNOWN' if plant.last_time_watered.nil?

        "#{time_ago_in_words(plant.last_time_watered).titleize} Ago"
    end
end
