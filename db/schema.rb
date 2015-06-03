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

ActiveRecord::Schema.define(version: 20150603013705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "round_id"
    t.string   "body"
    t.integer  "order"
    t.boolean  "guessed",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "answers", ["round_id"], name: "index_answers_on_round_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "room_id"
    t.string   "sender_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "messages", ["room_id"], name: "index_messages_on_room_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.string   "state",      default: "pending"
    t.string   "slug"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "rooms", ["slug"], name: "index_rooms_on_slug", using: :btree

  create_table "rounds", force: :cascade do |t|
    t.string   "prompt"
    t.integer  "room_id"
    t.string   "state",               default: "pending"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "suggested_prompt_id"
    t.integer  "topic_id"
  end

  add_index "rounds", ["room_id"], name: "index_rounds_on_room_id", using: :btree
  add_index "rounds", ["suggested_prompt_id"], name: "index_rounds_on_suggested_prompt_id", using: :btree
  add_index "rounds", ["topic_id"], name: "index_rounds_on_topic_id", using: :btree

  create_table "suggested_prompts", force: :cascade do |t|
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topic_answers", force: :cascade do |t|
    t.string   "body"
    t.integer  "order"
    t.integer  "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "topic_answers", ["topic_id"], name: "index_topic_answers_on_topic_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "prompt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answers", "rounds"
  add_foreign_key "messages", "rooms"
  add_foreign_key "rounds", "rooms"
  add_foreign_key "rounds", "suggested_prompts"
  add_foreign_key "rounds", "topics"
  add_foreign_key "topic_answers", "topics"
end
