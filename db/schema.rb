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

ActiveRecord::Schema.define(version: 20150622203804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bathrooms", force: :cascade do |t|
    t.string  "description"
    t.integer "status",      default: 0
  end

  create_table "scores", force: :cascade do |t|
    t.integer "user_id"
    t.integer "points",  default: 0
  end

  add_index "scores", ["user_id"], name: "index_scores_on_user_id", using: :btree

  create_table "trivia", force: :cascade do |t|
    t.string  "answer"
    t.integer "value"
    t.integer "user_id"
  end

  add_index "trivia", ["user_id"], name: "index_trivia_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.string   "email"
    t.string   "image_url"
    t.string   "token"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "provider"
    t.string   "uid"
    t.boolean  "bot",        default: false
  end

  add_foreign_key "scores", "users"
  add_foreign_key "trivia", "users"
end
