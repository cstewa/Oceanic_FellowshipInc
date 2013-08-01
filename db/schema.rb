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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130801060112) do

  create_table "airports", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "flights", :force => true do |t|
    t.datetime "departure_time"
    t.integer  "origin_airport_id"
    t.integer  "destination_airport_id"
    t.integer  "plane_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "flights_itineraries", :force => true do |t|
    t.integer "flight_id"
    t.integer "itinerary_id"
  end

  create_table "itineraries", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "roundtrip"
    t.boolean  "multi_city"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "itineraries", ["user_id"], :name => "index_itineraries_on_user_id"

  create_table "planes", :force => true do |t|
    t.float    "number"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "seats", :force => true do |t|
    t.integer  "user_id"
    t.integer  "row_number"
    t.string   "seat_letter"
    t.integer  "flight_id"
    t.string   "itinerary_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "seats", ["flight_id"], :name => "index_seats_on_flight_id"
  add_index "seats", ["user_id"], :name => "index_seats_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.boolean  "is_admin",                     :default => false
    t.boolean  "is_registered",                :default => false
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

end
