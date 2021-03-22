module CollectedPlantsHelper
    def water_status_color(plant)
        case plant.watering_status
        when :deprived
            'danger'
        when :wanting
            'warning'
        when :content
            'success'
        else
            'default'
        end
    end

    def last_watered_date_in_words(plant)
        return '[UNKNOWN]' if plant.last_time_watered.nil?

        "#{time_ago_in_words(plant.last_time_watered).titleize} Ago"
    end

    def formatted_water_time(datetime)
        return if datetime.nil?

        datetime.strftime('%a, %D')
    end
end
