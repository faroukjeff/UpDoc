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

ActiveRecord::Schema.define(version: 20180422183914) do

  create_table "credentials", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "usertype"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string   "name"
    t.string   "pnumber"
    t.string   "city"
    t.string   "street"
    t.integer  "hnumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pharmacies", force: :cascade do |t|
    t.string  "name"
    t.string  "pnumber"
    t.string  "city"
    t.integer "hnumber"
    t.string  "street"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name_string"
    t.text   "address"
    t.string "pnumber"
    t.string "Healthcare"
    t.string "password"
  end

end
