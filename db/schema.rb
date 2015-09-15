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

ActiveRecord::Schema.define(version: 20150915043715) do

  create_table "apick_settings", force: :cascade do |t|
    t.integer  "order"
    t.integer  "apick_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "apicks", force: :cascade do |t|
    t.integer  "draft_setting_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "bats", force: :cascade do |t|
    t.integer  "player_id"
    t.float    "bat_avg"
    t.integer  "rbi"
    t.integer  "homerun"
    t.integer  "steal"
    t.integer  "error"
    t.date     "record_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "draft_settings", force: :cascade do |t|
    t.integer  "order"
    t.boolean  "applied"
    t.integer  "draft_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drafts", force: :cascade do |t|
    t.integer  "time_limit"
    t.boolean  "is_complete"
    t.integer  "room_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer  "room_id"
    t.date     "game_date"
    t.integer  "team1"
    t.integer  "team2"
    t.string   "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pitches", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "win"
    t.integer  "strikeout"
    t.integer  "savehold"
    t.float    "era"
    t.date     "record_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "pos"
    t.string   "team"
    t.float    "war"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "win"
    t.integer  "strikeout"
    t.integer  "savehold"
    t.float    "era"
    t.float    "bat_avg"
    t.integer  "rbi"
    t.integer  "homerun"
    t.integer  "steal"
    t.integer  "error"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.string   "admin_id"
    t.string   "emblem"
    t.boolean  "is_classic_mode"
    t.boolean  "is_public_mode"
    t.string   "password"
    t.integer  "period"
    t.datetime "draft_time"
    t.integer  "size_limit"
    t.integer  "draft_time_limit"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "rosters", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "player_id"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
