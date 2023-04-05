# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_230_405_162_504) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'addresses', force: :cascade do |t|
    t.string 'building'
    t.integer 'flat_number'
    t.string 'road'
    t.string 'taluka'
    t.string 'district'
    t.string 'state'
    t.string 'pin_code'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_addresses_on_user_id'
  end

  create_table 'amenities', force: :cascade do |t|
    t.string 'name'
    t.datetime 'start_time'
    t.datetime 'end_time'
    t.boolean 'is_paid'
    t.integer 'only_for'
    t.float 'fee'
    t.bigint 'sector_id', null: false
    t.text 'terms_and_conditions'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['sector_id'], name: 'index_amenities_on_sector_id'
  end

  create_table 'commitee_members', force: :cascade do |t|
    t.string 'name'
    t.bigint 'user_id', null: false
    t.integer 'members_count'
    t.bigint 'commity_id', null: false
    t.integer 'designation'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['commity_id'], name: 'index_commitee_members_on_commity_id'
    t.index ['user_id'], name: 'index_commitee_members_on_user_id'
  end

  create_table 'commities', force: :cascade do |t|
    t.string 'title'
    t.bigint 'sector_id', null: false
    t.integer 'members_limit'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['sector_id'], name: 'index_commities_on_sector_id'
  end

  create_table 'complaints', force: :cascade do |t|
    t.string 'title'
    t.integer 'type'
    t.bigint 'user_id', null: false
    t.text 'description'
    t.bigint 'sector_id', null: false
    t.bigint 'flat_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['flat_id'], name: 'index_complaints_on_flat_id'
    t.index ['sector_id'], name: 'index_complaints_on_sector_id'
    t.index ['user_id'], name: 'index_complaints_on_user_id'
  end

  create_table 'documents', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.string 'name'
    t.string 'images'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_documents_on_user_id'
  end

  create_table 'events', force: :cascade do |t|
    t.string 'name'
    t.bigint 'sector_id', null: false
    t.datetime 'start_at'
    t.datetime 'end_at'
    t.string 'is_private'
    t.bigint 'flat_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['flat_id'], name: 'index_events_on_flat_id'
    t.index ['sector_id'], name: 'index_events_on_sector_id'
  end

  create_table 'family_members', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'contact'
    t.date 'birth_date'
    t.integer 'gender'
    t.bigint 'flat_id', null: false
    t.string 'pan_card_number'
    t.string 'adhaar_card_number'
    t.string 'avatar_url'
    t.integer 'maritial_status'
    t.integer 'status'
    t.integer 'relation_with'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['flat_id'], name: 'index_family_members_on_flat_id'
  end

  create_table 'flats', force: :cascade do |t|
    t.integer 'number'
    t.integer 'area_in_feet'
    t.boolean 'is_rented'
    t.bigint 'floor_id', null: false
    t.bigint 'owner_id', null: false
    t.bigint 'tenant_id', null: false
    t.integer 'structure'
    t.string 'letter_box_number'
    t.string 'electricity_meter_number'
    t.string 'gas_meter_number'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['floor_id'], name: 'index_flats_on_floor_id'
    t.index ['owner_id'], name: 'index_flats_on_owner_id'
    t.index ['tenant_id'], name: 'index_flats_on_tenant_id'
  end

  create_table 'floors', force: :cascade do |t|
    t.integer 'number'
    t.integer 'number_of_flats'
    t.boolean 'is_refuge_area'
    t.bigint 'wing_id', null: false
    t.boolean 'fire_exebution'
    t.datetime 'service_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['wing_id'], name: 'index_floors_on_wing_id'
  end

  create_table 'gate_entries', force: :cascade do |t|
    t.integer 'type'
    t.integer 'status'
    t.bigint 'flat_id', null: false
    t.string 'vehicle_number'
    t.string 'first_name'
    t.string 'last_name'
    t.integer 'gender'
    t.string 'contact'
    t.string 'vehicale_image_url'
    t.string 'person_image_url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['flat_id'], name: 'index_gate_entries_on_flat_id'
  end

  create_table 'parkings', force: :cascade do |t|
    t.string 'number'
    t.boolean 'is_covered'
    t.integer 'size_in_feet'
    t.bigint 'sector_id', null: false
    t.bigint 'owner_id', null: false
    t.bigint 'flat_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['flat_id'], name: 'index_parkings_on_flat_id'
    t.index ['owner_id'], name: 'index_parkings_on_owner_id'
    t.index ['sector_id'], name: 'index_parkings_on_sector_id'
  end

  create_table 'sectors', force: :cascade do |t|
    t.bigint 'society_id', null: false
    t.string 'name'
    t.string 'location'
    t.integer 'status'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['society_id'], name: 'index_sectors_on_society_id'
  end

  create_table 'societies', force: :cascade do |t|
    t.string 'name'
    t.string 'city'
    t.string 'state'
    t.string 'location'
    t.integer 'status'
    t.string 'registration_number'
    t.string 'contact'
    t.string 'email'
    t.text 'address'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'tenent_histories', force: :cascade do |t|
    t.bigint 'tenant_id', null: false
    t.bigint 'flat_id', null: false
    t.date 'move_in_at'
    t.date 'move_out_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['flat_id'], name: 'index_tenent_histories_on_flat_id'
    t.index ['tenant_id'], name: 'index_tenent_histories_on_tenant_id'
  end

  create_table 'user_informations', force: :cascade do |t|
    t.string 'first_name'
    t.string 'middle_name'
    t.string 'last_name'
    t.string 'contact'
    t.integer 'gender'
    t.date 'birth_date'
    t.string 'pan_card_number'
    t.string 'adhaar_card_number'
    t.boolean 'is_handicap'
    t.text 'handicap_details'
    t.integer 'maritial_status'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_user_informations_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'password'
    t.string 'email'
    t.integer 'status'
    t.boolean 'is_admin'
    t.string 'token'
    t.bigint 'society_id', null: false
    t.integer 'type'
    t.boolean 'is_primary_user'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['society_id'], name: 'index_users_on_society_id'
  end

  create_table 'vehicles', force: :cascade do |t|
    t.string 'number'
    t.string 'name'
    t.integer 'type'
    t.string 'color'
    t.bigint 'flat_id', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['flat_id'], name: 'index_vehicles_on_flat_id'
    t.index ['user_id'], name: 'index_vehicles_on_user_id'
  end

  create_table 'wings', force: :cascade do |t|
    t.string 'name'
    t.bigint 'sector_id', null: false
    t.integer 'number_of_lifts'
    t.integer 'structure'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['sector_id'], name: 'index_wings_on_sector_id'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'addresses', 'users'
  add_foreign_key 'amenities', 'sectors'
  add_foreign_key 'commitee_members', 'commities'
  add_foreign_key 'commitee_members', 'users'
  add_foreign_key 'commities', 'sectors'
  add_foreign_key 'complaints', 'flats'
  add_foreign_key 'complaints', 'sectors'
  add_foreign_key 'complaints', 'users'
  add_foreign_key 'documents', 'users'
  add_foreign_key 'events', 'flats'
  add_foreign_key 'events', 'sectors'
  add_foreign_key 'family_members', 'flats'
  add_foreign_key 'flats', 'floors'
  add_foreign_key 'flats', 'users', column: 'owner_id'
  add_foreign_key 'flats', 'users', column: 'tenant_id'
  add_foreign_key 'floors', 'wings'
  add_foreign_key 'gate_entries', 'flats'
  add_foreign_key 'parkings', 'flats'
  add_foreign_key 'parkings', 'sectors'
  add_foreign_key 'parkings', 'users', column: 'owner_id'
  add_foreign_key 'sectors', 'societies'
  add_foreign_key 'tenent_histories', 'flats'
  add_foreign_key 'tenent_histories', 'users', column: 'tenant_id'
  add_foreign_key 'user_informations', 'users'
  add_foreign_key 'users', 'societies'
  add_foreign_key 'vehicles', 'flats'
  add_foreign_key 'vehicles', 'users'
  add_foreign_key 'wings', 'sectors'
end
