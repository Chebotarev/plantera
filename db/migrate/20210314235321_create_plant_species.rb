class CreatePlantSpecies < ActiveRecord::Migration[6.1]
  def change
    create_table :plant_species do |t|
      t.string :common_name, index: true
      t.string :scientific_name, unique: true, null: false
      t.integer :light_level, null: false
      t.integer :watering_interval, null: false
      t.text :care_instructions

      t.timestamps
    end
  end
end
