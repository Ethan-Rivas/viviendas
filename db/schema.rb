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

ActiveRecord::Schema.define(version: 20160715180204) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "companies", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",       limit: 255
    t.string   "rfc",        limit: 255
  end

  create_table "contracts", force: :cascade do |t|
    t.string  "name",       limit: 255
    t.integer "company_id", limit: 4
    t.integer "package_id", limit: 4
  end

  create_table "kml_files", force: :cascade do |t|
    t.string   "upload_file_name",    limit: 255
    t.string   "upload_content_type", limit: 255
    t.integer  "upload_file_size",    limit: 4
    t.datetime "upload_updated_at"
    t.integer  "town_id",             limit: 4
  end

  create_table "kml_options", force: :cascade do |t|
    t.integer "kml_settlement_id", limit: 4
    t.integer "settlement_id",     limit: 4
    t.integer "rank",              limit: 4
  end

  create_table "kml_settlements", force: :cascade do |t|
    t.string  "name",          limit: 255
    t.float   "geo_x",         limit: 24
    t.float   "geo_y",         limit: 24
    t.integer "settlement_id", limit: 4
    t.integer "kml_file_id",   limit: 4
  end

  add_index "kml_settlements", ["kml_file_id"], name: "index_kml_settlements_on_kml_file_id", using: :btree

  create_table "location_contracts", force: :cascade do |t|
    t.integer "location_id", limit: 4
    t.integer "contract_id", limit: 4
  end

  create_table "locations", force: :cascade do |t|
    t.string  "name",    limit: 255
    t.integer "town_id", limit: 4
  end

  create_table "packages", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",       limit: 255
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "settlement_id",      limit: 4
  end

  create_table "progress_checks", force: :cascade do |t|
    t.string  "name",  limit: 255
    t.integer "value", limit: 4
  end

  create_table "progress_inputs", force: :cascade do |t|
    t.integer  "progress_check_id", limit: 4
    t.integer  "settlement_id",     limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "progress",          limit: 4, default: 0
  end

  create_table "settlements", force: :cascade do |t|
    t.string  "owner_name",       limit: 255
    t.string  "address",          limit: 255
    t.float   "geo_x",            limit: 24
    t.float   "geo_y",            limit: 24
    t.integer "no",               limit: 4
    t.string  "municipio",        limit: 255
    t.string  "nombre",           limit: 255
    t.string  "apellido_paterno", limit: 255
    t.string  "apellido_materno", limit: 255
    t.string  "curp",             limit: 255
    t.string  "telefono",         limit: 255
    t.date    "fecha_nacimiento"
    t.string  "cp",               limit: 255
    t.string  "colonia",          limit: 255
    t.string  "localidad",        limit: 255
    t.string  "calle",            limit: 255
    t.integer "num_casa",         limit: 4
    t.integer "cruzamientos",     limit: 4
    t.string  "dia",              limit: 255
    t.string  "mes",              limit: 255
    t.string  "anio",             limit: 255
    t.string  "sifode",           limit: 255
    t.string  "sexo",             limit: 255
    t.string  "resultado",        limit: 255
    t.string  "marginacion",      limit: 255
    t.string  "procedencia",      limit: 255
    t.string  "procede",          limit: 255
    t.string  "observacion",      limit: 255
    t.integer "package_id",       limit: 4
    t.integer "town_id",          limit: 4
    t.string  "cuis",             limit: 255
    t.integer "location_id",      limit: 4
  end

  create_table "towns", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "trigrams", force: :cascade do |t|
    t.string  "trigram",     limit: 3
    t.integer "score",       limit: 2
    t.integer "owner_id",    limit: 4
    t.string  "owner_type",  limit: 255
    t.string  "fuzzy_field", limit: 255
  end

  add_index "trigrams", ["owner_id", "owner_type", "fuzzy_field", "trigram", "score"], name: "index_for_match", using: :btree
  add_index "trigrams", ["owner_id", "owner_type"], name: "index_by_owner", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",               limit: 255,   default: "email", null: false
    t.string   "uid",                    limit: 255,   default: "",      null: false
    t.string   "encrypted_password",     limit: 255,   default: "",      null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "name",                   limit: 255
    t.string   "nickname",               limit: 255
    t.string   "image",                  limit: 255
    t.string   "email",                  limit: 255
    t.text     "tokens",                 limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contract_id",            limit: 4
    t.string   "phone_number",           limit: 255
    t.string   "code",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

end
