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

ActiveRecord::Schema.define(version: 2018_10_10_115457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.text "name", default: "", null: false
    t.string "city", default: "", null: false
    t.string "postal_code", default: "", null: false
    t.string "county", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "provider_name", default: "", null: false
    t.string "uid", default: "", null: false
    t.string "token", default: "", null: false
    t.boolean "expires", default: false, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_providers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "user_name", default: "", null: false
    t.string "name", default: "", null: false
    t.string "type"
    t.bigint "employer_id"
    t.boolean "profile_completed", default: false
    t.text "description"
    t.integer "contact_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["employer_id"], name: "index_users_on_employer_id"
  end

  create_table "work_experiences", force: :cascade do |t|
    t.integer "lawyer_id", null: false
    t.string "company_name", null: false
    t.string "designation", null: false
    t.string "location", null: false
    t.datetime "from_date"
    t.datetime "to_date"
    t.boolean "currently_working"
    t.text "responsibilities"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lawyer_id"], name: "index_work_experiences_on_lawyer_id"
  end

end
