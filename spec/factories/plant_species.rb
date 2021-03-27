FactoryBot.define do
  factory :plant_species do
    scientific_name { 'Plant Species' }
    common_name { 'Common Name' }
    watering_interval { 5 }
    light_level { 1 }
    care_instructions { 'Care Instructions for plant' }
  end
end
