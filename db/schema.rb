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

ActiveRecord::Schema.define(version: 2018_11_11_163011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

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

  create_table "bids", force: :cascade do |t|
    t.integer "lawyer_id", null: false
    t.bigint "claim_id", null: false
    t.float "amount", default: 0.0, null: false
    t.integer "status", default: 0, null: false
    t.integer "fee_type", default: 0, null: false
    t.boolean "is_deleted", default: false, null: false
    t.string "terms_of_service"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["claim_id"], name: "index_bids_on_claim_id"
  end

  create_table "claims", force: :cascade do |t|
    t.integer "business_id", null: false
    t.bigint "collection_area_id", null: false
    t.float "amount", null: false
    t.string "identifier", null: false
    t.string "additional_desciption", null: false
    t.integer "status", default: 0, null: false
    t.boolean "is_rfp", default: false, null: false
    t.string "county", default: "", null: false
    t.datetime "pending_since", null: false
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_area_id"], name: "index_claims_on_collection_area_id"
  end

  create_table "collection_areas", force: :cascade do |t|
    t.string "name", default: "f", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collection_areas_lawyers", id: false, force: :cascade do |t|
    t.bigint "collection_area_id", null: false
    t.bigint "lawyer_id", null: false
  end

  create_table "collection_areas_users", id: false, force: :cascade do |t|
    t.bigint "collection_area_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "debtors", force: :cascade do |t|
    t.string "county", null: false
    t.string "name", null: false
    t.string "address", null: false
    t.string "city", null: false
    t.string "postal_code", null: false
    t.bigint "claim_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["claim_id"], name: "index_debtors_on_claim_id"
  end

  create_table "educations", force: :cascade do |t|
    t.integer "lawyer_id", null: false
    t.string "field_of_study", null: false
    t.string "institution", null: false
    t.string "from_date", null: false
    t.string "to_date"
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
    t.string "image_url"
    t.index ["user_id"], name: "index_providers_on_user_id"
  end

  create_table "request_for_proposals", force: :cascade do |t|
    t.integer "lawyer_id", null: false
    t.integer "claim_id", null: false
    t.boolean "is_responded", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
