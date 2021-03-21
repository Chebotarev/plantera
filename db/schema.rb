# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_21_174304) do

  create_table "collected_plants", force: :cascade do |t|
    t.string "nick_name"
    t.integer "species_id", null: false
    t.integer "owner_id", null: false
    t.datetime "last_time_watered"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["last_time_watered"], name: "index_collected_plants_on_last_time_watered"
    t.index ["nick_name"], name: "index_collected_plants_on_nick_name"
    t.index ["owner_id"], name: "index_collected_plants_on_owner_id"
    t.index ["species_id"], name: "index_collected_plants_on_species_id"
  end

  create_table "plant_species", force: :cascade do |t|
    t.string "common_name"
    t.string "scientific_name", null: false
    t.integer "light_level", null: false
    t.integer "watering_interval", null: false
    t.text "care_instructions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["common_name"], name: "index_plant_species_on_common_name"
    t.index ["scientific_name"], name: "index_plant_species_on_scientific_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "collected_plants", "plant_species", column: "species_id"
  add_foreign_key "collected_plants", "users", column: "owner_id"
end
