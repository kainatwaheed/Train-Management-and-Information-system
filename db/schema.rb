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

ActiveRecord::Schema.define(version: 20160610114016) do

  create_table "fares", force: :cascade do |t|
    t.string   "traintype"
    t.integer  "distance"
    t.integer  "AC"
    t.string   "bus"
    t.integer  "eco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "trainroute_id"
    t.integer  "seats"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "seats", force: :cascade do |t|
    t.date     "deptdate"
    t.string   "tname"
    t.integer  "seat1"
    t.integer  "seat2"
    t.integer  "seat3"
    t.integer  "trainroute_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "seats", ["trainroute_id"], name: "index_seats_on_trainroute_id"

  create_table "stations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.text     "post"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainclasses", force: :cascade do |t|
    t.string   "name"
    t.integer  "train_id"
    t.integer  "totalseats"
    t.integer  "fare"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainfares", force: :cascade do |t|
    t.integer  "train_id"
    t.string   "source"
    t.string   "destination"
    t.integer  "fare1"
    t.integer  "fare2"
    t.integer  "fare3"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.string   "traintype"
  end

  create_table "trainroutes", force: :cascade do |t|
    t.integer  "train_id"
    t.string   "source"
    t.string   "destination"
    t.date     "deptdate"
    t.date     "arrivaldate"
    t.time     "deptime"
    t.time     "arrivaltime"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "trainname"
    t.string   "name"
    t.integer  "distance"
    t.integer  "totalseat"
    t.boolean  "available",   default: true
  end

  create_table "trains", force: :cascade do |t|
    t.string   "name"
    t.integer  "noofseats"
    t.integer  "noofclasses"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "traintype"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "roles_mask"             default: 2
    t.boolean  "admin",                  default: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
