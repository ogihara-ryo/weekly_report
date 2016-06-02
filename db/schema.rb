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

ActiveRecord::Schema.define(version: 20160531123702) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "report_id"
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "comments", ["report_id"], name: "index_comments_on_report_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "reports", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "place"
    t.integer  "overwork"
    t.text     "work"
    t.text     "probrem"
    t.text     "solution"
    t.text     "plan"
    t.text     "other"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reports", ["user_id"], name: "index_reports_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "signin_id",                       null: false
    t.string   "password_digest",                 null: false
    t.string   "name"
    t.boolean  "admin",           default: false, null: false
    t.string   "remember_token"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "comments", "reports"
  add_foreign_key "comments", "users"
  add_foreign_key "reports", "users"
end
