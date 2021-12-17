# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_17_141728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_users", force: :cascade do |t|
    t.bigint "address_id"
    t.bigint "user_id"
    t.string "address_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_address_users_on_address_id"
    t.index ["user_id"], name: "index_address_users_on_user_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "address_1", null: false
    t.string "address_2"
    t.string "city", null: false
    t.string "province", null: false
    t.string "postal_code", null: false
    t.string "country", default: "USA", null: false
    t.datetime "archived_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "content", null: false
    t.integer "sender_id", null: false
    t.integer "recipient_id", null: false
    t.datetime "seen_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipient_id"], name: "index_messages_on_recipient_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "page_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "page_id", null: false
    t.string "role", default: "manager"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["page_id"], name: "index_page_users_on_page_id"
    t.index ["user_id"], name: "index_page_users_on_user_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title", null: false
    t.string "slug", null: false
    t.text "description", null: false
    t.datetime "archived_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "pages_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pages_id"], name: "index_posts_on_pages_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "aasm_state", default: "pending", null: false
    t.float "amount", default: 0.0, null: false
    t.bigint "users_id"
    t.bigint "pages_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pages_id"], name: "index_subscriptions_on_pages_id"
    t.index ["users_id"], name: "index_subscriptions_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "username", null: false
    t.string "stripe_id"
    t.string "role", default: "user", null: false
    t.datetime "archived_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "messages", "users", column: "recipient_id"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "page_users", "pages"
  add_foreign_key "page_users", "users"
  add_foreign_key "posts", "pages", column: "pages_id"
end
