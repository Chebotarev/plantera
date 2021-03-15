# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PlantSpecies.find_or_create_by!(
    common_name: 'Snake plant',
    scientific_name: 'Dracaena trifasciata',
    light_level: 2,
    watering_interval: 432000,
    care_instructions: <<-CARE
    Do not overwater to avoid root rot. Ensure the pot is big enough for the growth
    CARE
)
