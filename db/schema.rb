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

ActiveRecord::Schema.define(version: 20161031161743) do

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "reporter_name"
    t.string   "reporter_mail"
    t.string   "reporter_phone"
    t.string   "title"
    t.text     "content"
    t.string   "written_at"
    t.string   "from"
    t.string   "editor_name"
    t.string   "editor_email"
    t.string   "img_url"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "replies", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.string   "user_name"
    t.integer  "option_num"
    t.string   "link"
    t.string   "location_text"
    t.text     "location"
    t.text     "content"
    t.integer  "like_count",    default: 0
    t.integer  "unlike_count",  default: 0
    t.string   "img_url"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "abbr_text"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "viewcounts", force: :cascade do |t|
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
