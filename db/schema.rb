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

ActiveRecord::Schema.define(version: 20170203072835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contents", force: :cascade do |t|
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "text",         limit: 200
    t.integer  "score",                    default: 0
    t.integer  "place"
    t.integer  "head_line_id"
    t.integer  "theme_id"
    t.string   "image"
    t.index ["head_line_id"], name: "index_contents_on_head_line_id", using: :btree
    t.index ["theme_id"], name: "index_contents_on_theme_id", using: :btree
  end

  create_table "editors", force: :cascade do |t|
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "email",      limit: 25
    t.string   "username",   limit: 15
    t.string   "password",   limit: 15
    t.string   "location"
    t.integer  "points",                default: 0
  end

  create_table "head_lines", force: :cascade do |t|
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "text",       limit: 200
    t.integer  "score",                  default: 0
    t.integer  "theme_id"
    t.string   "image"
    t.index ["theme_id"], name: "index_head_lines_on_theme_id", using: :btree
  end

  create_table "head_lines_subjects", id: false, force: :cascade do |t|
    t.integer "head_line_id"
    t.integer "subject_id"
    t.index ["head_line_id", "subject_id"], name: "index_head_lines_subjects_on_head_line_id_and_subject_id", using: :btree
  end

  create_table "subjects", force: :cascade do |t|
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "text",       limit: 25
    t.integer  "score",                 default: 0
    t.string   "image"
  end

  create_table "themes", force: :cascade do |t|
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "text",       limit: 25
    t.integer  "score",                 default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 15
    t.string   "last_name",       limit: 15
    t.string   "email",           limit: 25
    t.string   "username",        limit: 15
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "password_digest"
  end

end
