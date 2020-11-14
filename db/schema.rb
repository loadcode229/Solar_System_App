# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_14_174408) do

  create_table "planet_moons", force: :cascade do |t|
    t.string "name"
    t.string "planet_moon_orbits"
    t.text "description"
    t.string "length_of_year"
    t.integer "user_id", null: false
    t.integer "planet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.index ["planet_id"], name: "index_planet_moons_on_planet_id"
    t.index ["user_id"], name: "index_planet_moons_on_user_id"
  end

  create_table "planets", force: :cascade do |t|
    t.string "name"
    t.string "type_of_planet"
    t.text "description"
    t.string "length_of_year"
    t.string "distance_from_sun"
    t.string "moons"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "planet_moons", "planets"
  add_foreign_key "planet_moons", "users"
end
