class CreateCollectedPlants < ActiveRecord::Migration[6.1]
  def change
    create_table :collected_plants do |t|
      t.string :nick_name
      t.belongs_to :species, null: false, foreign_key: { to_table: 'plant_species' }
      t.references :owner, null: false, foreign_key: { to_table: 'users' }
      t.datetime :last_time_watered

      t.timestamps
    end
    add_index :collected_plants, :nick_name
    add_index :collected_plants, :last_time_watered
  end
end
