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

ActiveRecord::Schema.define(version: 20150616152958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "natures", force: :cascade do |t|
    t.string   "name"
    t.string   "increase"
    t.string   "decrease"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokemon", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "nickname"
    t.jsonb    "stats",      default: {"hp"=>0, "speed"=>0, "attack"=>0, "defense"=>0, "special_attack"=>0, "special_defense"=>0}
    t.jsonb    "evs",        default: {"hp"=>0, "speed"=>0, "attack"=>0, "defense"=>0, "special_attack"=>0, "special_defense"=>0}
    t.integer  "level",      default: 1
    t.datetime "created_at",                                                                                                       null: false
    t.datetime "updated_at",                                                                                                       null: false
    t.integer  "species_id"
    t.integer  "nature_id"
  end

  add_index "pokemon", ["user_id"], name: "index_pokemon_on_user_id", using: :btree

  create_table "species", force: :cascade do |t|
    t.string   "name"
    t.string   "national_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "uid"
    t.string   "provider"
    t.string   "username"
    t.string   "email"
    t.string   "image_url"
    t.string   "phone"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "pokemon", "users"
end
