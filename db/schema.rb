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

ActiveRecord::Schema.define(version: 20151115043346) do

  create_table "authentication_providers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "authentication_providers", ["name"], name: "index_name_on_authentication_providers", using: :btree

  create_table "feeds", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.string   "url",          limit: 255,   null: false
    t.text     "description",  limit: 65535
    t.string   "image_url",    limit: 255
    t.string   "feed_type",    limit: 255
    t.string   "feed_version", limit: 255
    t.string   "encoding",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feeds", ["title"], name: "index_feeds_on_title", using: :btree
  add_index "feeds", ["url"], name: "index_feeds_on_url", using: :btree

  create_table "user_authentications", force: :cascade do |t|
    t.integer  "user_id",                    limit: 4
    t.integer  "authentication_provider_id", limit: 4
    t.string   "uid",                        limit: 255
    t.string   "token",                      limit: 255
    t.datetime "token_expires_at"
    t.text     "params",                     limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "user_authentications", ["authentication_provider_id"], name: "index_user_authentications_on_authentication_provider_id", using: :btree
  add_index "user_authentications", ["user_id"], name: "index_user_authentications_on_user_id", using: :btree

  create_table "userfeeds", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "feed_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "userfeeds", ["feed_id"], name: "index_userfeeds_on_feed_id", using: :btree
  add_index "userfeeds", ["user_id"], name: "index_userfeeds_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "username",               limit: 255,             null: false
    t.integer  "role",                   limit: 4,   default: 1, null: false
    t.string   "email",                  limit: 255,             null: false
    t.string   "password_digest",        limit: 255
    t.string   "token",                  limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["first_name"], name: "index_users_on_first_name", using: :btree
  add_index "users", ["last_name"], name: "index_users_on_last_name", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["token"], name: "index_users_on_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "userfeeds", "feeds", on_delete: :cascade
  add_foreign_key "userfeeds", "users", on_delete: :cascade
end
