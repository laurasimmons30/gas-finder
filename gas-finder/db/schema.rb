# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151105232415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.integer "vehicle_id"
    t.integer "year",        null: false
    t.string  "make",        null: false
    t.string  "model",       null: false
    t.float   "city_mpg"
    t.float   "highway_mpg"
    t.float   "avg_mpg"
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "starting_gas"
    t.integer  "ending_gas"
    t.integer  "total_miles"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
  end

end
