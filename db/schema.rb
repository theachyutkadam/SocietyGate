# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_16_163507) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.integer "flat_number"
    t.string "building"
    t.string "street_name"
    t.string "city"
    t.string "state"
    t.string "pin_code"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id", unique: true
  end

  create_table "amenities", force: :cascade do |t|
    t.string "name"
    t.time "open_time"
    t.time "close_time"
    t.boolean "is_paid"
    t.integer "only_for"
    t.float "fee"
    t.bigint "building_id", null: false
    t.text "terms_and_conditions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_amenities_on_building_id"
  end

  create_table "buildings", force: :cascade do |t|
    t.bigint "society_id", null: false
    t.string "name"
    t.string "location"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["society_id"], name: "index_buildings_on_society_id"
  end

  create_table "commitee_members", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.integer "members_count"
    t.bigint "commity_id", null: false
    t.integer "designation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commity_id"], name: "index_commitee_members_on_commity_id"
    t.index ["user_id"], name: "index_commitee_members_on_user_id", unique: true
  end

  create_table "commities", force: :cascade do |t|
    t.string "title"
    t.bigint "building_id", null: false
    t.integer "members_limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_commities_on_building_id"
  end

  create_table "complaints", force: :cascade do |t|
    t.string "title"
    t.integer "status"
    t.integer "complaint_type"
    t.bigint "user_id", null: false
    t.text "description"
    t.bigint "building_id", null: false
    t.bigint "flat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_complaints_on_building_id"
    t.index ["flat_id"], name: "index_complaints_on_flat_id"
    t.index ["user_id"], name: "index_complaints_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "images"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.bigint "building_id", null: false
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean "is_private"
    t.bigint "flat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_events_on_building_id"
    t.index ["flat_id"], name: "index_events_on_flat_id"
  end

  create_table "family_members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "contact", null: false
    t.date "birth_date"
    t.integer "gender"
    t.bigint "flat_id", null: false
    t.string "pan_card_number"
    t.string "adhaar_card_number"
    t.string "avatar_url"
    t.integer "maritial_status"
    t.integer "status"
    t.integer "relation_with"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adhaar_card_number"], name: "index_family_members_on_adhaar_card_number", unique: true
    t.index ["contact"], name: "index_family_members_on_contact", unique: true
    t.index ["flat_id"], name: "index_family_members_on_flat_id"
    t.index ["pan_card_number"], name: "index_family_members_on_pan_card_number", unique: true
  end

  create_table "flats", force: :cascade do |t|
    t.string "number"
    t.integer "area_in_feet"
    t.boolean "is_rented"
    t.bigint "floor_id", null: false
    t.bigint "owner_id", null: false
    t.bigint "tenant_id"
    t.integer "structure"
    t.string "letter_box_number"
    t.string "electricity_meter_number", null: false
    t.string "gas_meter_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["electricity_meter_number"], name: "index_flats_on_electricity_meter_number", unique: true
    t.index ["floor_id"], name: "index_flats_on_floor_id"
    t.index ["gas_meter_number"], name: "index_flats_on_gas_meter_number", unique: true
    t.index ["owner_id"], name: "index_flats_on_owner_id"
    t.index ["tenant_id"], name: "index_flats_on_tenant_id"
  end

  create_table "floors", force: :cascade do |t|
    t.string "number"
    t.integer "number_of_flats"
    t.boolean "is_refuge_area"
    t.bigint "wing_id", null: false
    t.boolean "fire_exebution"
    t.datetime "service_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wing_id"], name: "index_floors_on_wing_id"
  end

  create_table "gate_entries", force: :cascade do |t|
    t.integer "entry_type"
    t.integer "status"
    t.bigint "flat_id", null: false
    t.string "vehicle_number"
    t.string "first_name"
    t.string "last_name"
    t.integer "gender"
    t.string "contact"
    t.string "vehicale_image_url"
    t.string "person_image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_gate_entries_on_flat_id"
  end

  create_table "motor_alert_locks", force: :cascade do |t|
    t.bigint "alert_id", null: false
    t.string "lock_timestamp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alert_id", "lock_timestamp"], name: "index_motor_alert_locks_on_alert_id_and_lock_timestamp", unique: true
    t.index ["alert_id"], name: "index_motor_alert_locks_on_alert_id"
  end

  create_table "motor_alerts", force: :cascade do |t|
    t.bigint "query_id", null: false
    t.string "name", null: false
    t.text "description"
    t.text "to_emails", null: false
    t.boolean "is_enabled", default: true, null: false
    t.text "preferences", null: false
    t.bigint "author_id"
    t.string "author_type"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "motor_alerts_name_unique_index", unique: true, where: "(deleted_at IS NULL)"
    t.index ["query_id"], name: "index_motor_alerts_on_query_id"
    t.index ["updated_at"], name: "index_motor_alerts_on_updated_at"
  end

  create_table "motor_api_configs", force: :cascade do |t|
    t.string "name", null: false
    t.string "url", null: false
    t.text "preferences", null: false
    t.text "credentials", null: false
    t.text "description"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "motor_api_configs_name_unique_index", unique: true, where: "(deleted_at IS NULL)"
  end

  create_table "motor_audits", force: :cascade do |t|
    t.string "auditable_id"
    t.string "auditable_type"
    t.string "associated_id"
    t.string "associated_type"
    t.bigint "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.bigint "version", default: 0
    t.text "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "motor_auditable_associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "motor_auditable_index"
    t.index ["created_at"], name: "index_motor_audits_on_created_at"
    t.index ["request_uuid"], name: "index_motor_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "motor_auditable_user_index"
  end

  create_table "motor_configs", force: :cascade do |t|
    t.string "key", null: false
    t.text "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_motor_configs_on_key", unique: true
    t.index ["updated_at"], name: "index_motor_configs_on_updated_at"
  end

  create_table "motor_dashboards", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.text "preferences", null: false
    t.bigint "author_id"
    t.string "author_type"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "motor_dashboards_title_unique_index", unique: true, where: "(deleted_at IS NULL)"
    t.index ["updated_at"], name: "index_motor_dashboards_on_updated_at"
  end

  create_table "motor_forms", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.text "api_path", null: false
    t.string "http_method", null: false
    t.text "preferences", null: false
    t.bigint "author_id"
    t.string "author_type"
    t.datetime "deleted_at"
    t.string "api_config_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "motor_forms_name_unique_index", unique: true, where: "(deleted_at IS NULL)"
    t.index ["updated_at"], name: "index_motor_forms_on_updated_at"
  end

  create_table "motor_note_tag_tags", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "note_id", null: false
    t.index ["note_id", "tag_id"], name: "motor_note_tags_note_id_tag_id_index", unique: true
    t.index ["tag_id"], name: "index_motor_note_tag_tags_on_tag_id"
  end

  create_table "motor_note_tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "motor_note_tags_name_unique_index", unique: true
  end

  create_table "motor_notes", force: :cascade do |t|
    t.text "body"
    t.bigint "author_id"
    t.string "author_type"
    t.string "record_id", null: false
    t.string "record_type", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id", "author_type"], name: "motor_notes_author_id_author_type_index"
  end

  create_table "motor_notifications", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.bigint "recipient_id", null: false
    t.string "recipient_type", null: false
    t.string "record_id"
    t.string "record_type"
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id", "recipient_type"], name: "motor_notifications_recipient_id_recipient_type_index"
    t.index ["record_id", "record_type"], name: "motor_notifications_record_id_record_type_index"
  end

  create_table "motor_queries", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.text "sql_body", null: false
    t.text "preferences", null: false
    t.bigint "author_id"
    t.string "author_type"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "motor_queries_name_unique_index", unique: true, where: "(deleted_at IS NULL)"
    t.index ["updated_at"], name: "index_motor_queries_on_updated_at"
  end

  create_table "motor_reminders", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.string "author_type", null: false
    t.bigint "recipient_id", null: false
    t.string "recipient_type", null: false
    t.string "record_id"
    t.string "record_type"
    t.datetime "scheduled_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id", "author_type"], name: "motor_reminders_author_id_author_type_index"
    t.index ["recipient_id", "recipient_type"], name: "motor_reminders_recipient_id_recipient_type_index"
    t.index ["record_id", "record_type"], name: "motor_reminders_record_id_record_type_index"
    t.index ["scheduled_at"], name: "index_motor_reminders_on_scheduled_at"
  end

  create_table "motor_resources", force: :cascade do |t|
    t.string "name", null: false
    t.text "preferences", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_motor_resources_on_name", unique: true
    t.index ["updated_at"], name: "index_motor_resources_on_updated_at"
  end

  create_table "motor_taggable_tags", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "taggable_id", null: false
    t.string "taggable_type", null: false
    t.index ["tag_id"], name: "index_motor_taggable_tags_on_tag_id"
    t.index ["taggable_id", "taggable_type", "tag_id"], name: "motor_polymorphic_association_tag_index", unique: true
  end

  create_table "motor_tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "motor_tags_name_unique_index", unique: true
  end

  create_table "parkings", force: :cascade do |t|
    t.string "number"
    t.boolean "is_covered"
    t.integer "size_in_feet"
    t.bigint "building_id", null: false
    t.bigint "owner_id", null: false
    t.bigint "flat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_parkings_on_building_id"
    t.index ["flat_id"], name: "index_parkings_on_flat_id"
    t.index ["owner_id"], name: "index_parkings_on_owner_id"
  end

  create_table "societies", force: :cascade do |t|
    t.string "name", null: false
    t.string "city"
    t.string "state"
    t.string "location"
    t.integer "status"
    t.string "registration_number", null: false
    t.string "contact", null: false
    t.string "email", null: false
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact"], name: "index_societies_on_contact", unique: true
    t.index ["email"], name: "index_societies_on_email", unique: true
    t.index ["name"], name: "index_societies_on_name", unique: true
    t.index ["registration_number"], name: "index_societies_on_registration_number", unique: true
  end

  create_table "tenant_histories", force: :cascade do |t|
    t.bigint "tenant_id", null: false
    t.bigint "flat_id", null: false
    t.date "move_in_at"
    t.date "move_out_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_tenant_histories_on_flat_id"
    t.index ["tenant_id"], name: "index_tenant_histories_on_tenant_id"
  end

  create_table "user_informations", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "contact", null: false
    t.integer "gender"
    t.date "birth_date"
    t.string "pan_card_number", null: false
    t.string "adhaar_card_number", null: false
    t.boolean "is_handicap"
    t.text "handicap_details"
    t.integer "maritial_status"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adhaar_card_number"], name: "index_user_informations_on_adhaar_card_number", unique: true
    t.index ["contact"], name: "index_user_informations_on_contact", unique: true
    t.index ["pan_card_number"], name: "index_user_informations_on_pan_card_number", unique: true
    t.index ["user_id"], name: "index_user_informations_on_user_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "password"
    t.string "email", null: false
    t.integer "status"
    t.boolean "is_admin"
    t.string "token", null: false
    t.bigint "society_id", null: false
    t.integer "user_type"
    t.boolean "is_primary_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["society_id"], name: "index_users_on_society_id"
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "number"
    t.string "company"
    t.string "name"
    t.integer "status"
    t.integer "vehicle_type"
    t.string "color"
    t.bigint "flat_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_vehicles_on_flat_id"
    t.index ["user_id"], name: "index_vehicles_on_user_id"
  end

  create_table "wings", force: :cascade do |t|
    t.string "name"
    t.bigint "building_id", null: false
    t.integer "number_of_lifts"
    t.integer "structure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_wings_on_building_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "users"
  add_foreign_key "amenities", "buildings"
  add_foreign_key "buildings", "societies"
  add_foreign_key "commitee_members", "commities"
  add_foreign_key "commitee_members", "users"
  add_foreign_key "commities", "buildings"
  add_foreign_key "complaints", "buildings"
  add_foreign_key "complaints", "flats"
  add_foreign_key "complaints", "users"
  add_foreign_key "documents", "users"
  add_foreign_key "events", "buildings"
  add_foreign_key "events", "flats"
  add_foreign_key "family_members", "flats"
  add_foreign_key "flats", "floors"
  add_foreign_key "flats", "users", column: "owner_id"
  add_foreign_key "flats", "users", column: "tenant_id"
  add_foreign_key "floors", "wings"
  add_foreign_key "gate_entries", "flats"
  add_foreign_key "motor_alert_locks", "motor_alerts", column: "alert_id"
  add_foreign_key "motor_alerts", "motor_queries", column: "query_id"
  add_foreign_key "motor_note_tag_tags", "motor_note_tags", column: "tag_id"
  add_foreign_key "motor_note_tag_tags", "motor_notes", column: "note_id"
  add_foreign_key "motor_taggable_tags", "motor_tags", column: "tag_id"
  add_foreign_key "parkings", "buildings"
  add_foreign_key "parkings", "flats"
  add_foreign_key "parkings", "users", column: "owner_id"
  add_foreign_key "tenant_histories", "flats"
  add_foreign_key "tenant_histories", "users", column: "tenant_id"
  add_foreign_key "user_informations", "users"
  add_foreign_key "users", "societies"
  add_foreign_key "vehicles", "flats"
  add_foreign_key "vehicles", "users"
  add_foreign_key "wings", "buildings"
end
