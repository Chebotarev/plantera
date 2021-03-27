FactoryBot.define do
  factory :collected_plant do
    nick_name { 'My Plant' }
    last_time_watered { 2.days.ago }
    association :species, factory: :plant_species

    trait :content do
      last_time_watered { |plant| plant.species.watering_interval.days.ago + 1.day }
    end

    trait :wanting do
      last_time_watered { |plant| plant.species.watering_interval.days.ago - 1.days }
    end

    trait :deprived do
      last_time_watered { |plant| plant.species.watering_interval.days.ago - 5.days }
    end

    factory :content_plant, traits: [:content]
    factory :wanting_plant, traits: [:wanting]
    factory :deprived_plant, traits: [:deprived]
  end
end
