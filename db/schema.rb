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

ActiveRecord::Schema.define(version: 20160706083716) do

  create_table "channels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "channels_messages", id: false, force: :cascade do |t|
    t.integer "channel_id"
    t.integer "message_id"
    t.index ["channel_id"], name: "index_channels_messages_on_channel_id"
    t.index ["message_id"], name: "index_channels_messages_on_message_id"
  end

  create_table "displays", force: :cascade do |t|
    t.string   "name"
    t.integer  "show_date"
    t.integer  "show_from"
    t.integer  "show_limit"
    t.integer  "columns"
    t.integer  "lines"
    t.text     "consigne"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "logo"
  end

  create_table "keywords", force: :cascade do |t|
    t.string   "word"
    t.integer  "channel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_keywords_on_channel_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.string   "author"
    t.integer  "source_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "provider_id"
    t.string   "picture"
    t.index ["provider_id"], name: "index_messages_on_provider_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string   "name"
    t.string   "img_src"
    t.string   "color"
    t.string   "picto"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
