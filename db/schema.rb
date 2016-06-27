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

ActiveRecord::Schema.define(version: 20160627031502) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "companies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "rfc"
  end

  create_table "contracts", force: :cascade do |t|
    t.string  "name"
    t.integer "company_id"
    t.integer "package_id"
  end

  create_table "kml_files", force: :cascade do |t|
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.integer  "town_id"
  end

  create_table "kml_options", force: :cascade do |t|
    t.integer "kml_settlement_id"
    t.integer "settlement_id"
    t.integer "rank"
  end

  create_table "kml_settlements", force: :cascade do |t|
    t.string  "name"
    t.float   "geo_x"
    t.float   "geo_y"
    t.integer "settlement_id"
    t.integer "kml_file_id"
  end

  add_index "kml_settlements", ["kml_file_id"], name: "index_kml_settlements_on_kml_file_id"

  create_table "packages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "settlement_id"
  end

  create_table "progress_checks", force: :cascade do |t|
    t.string  "name"
    t.integer "value"
  end

  create_table "progress_inputs", force: :cascade do |t|
    t.integer  "progress_check_id"
    t.integer  "settlement_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "progress",          default: 0
  end

  create_table "settlements", force: :cascade do |t|
    t.string  "owner_name"
    t.string  "address"
    t.float   "geo_x"
    t.float   "geo_y"
    t.integer "no"
    t.string  "municipio"
    t.string  "nombre"
    t.string  "apellido_paterno"
    t.string  "apellido_materno"
    t.string  "curp"
    t.string  "telefono"
    t.date    "fecha_nacimiento"
    t.string  "cp"
    t.string  "colonia"
    t.string  "localidad"
    t.string  "calle"
    t.integer "num_casa"
    t.integer "cruzamientos"
    t.string  "dia"
    t.string  "mes"
    t.string  "anio"
    t.string  "sifode"
    t.string  "sexo"
    t.string  "resultado"
    t.string  "marginacion"
    t.string  "procedencia"
    t.string  "procede"
    t.string  "observacion"
    t.integer "package_id"
    t.integer "town_id"
  end

  create_table "towns", force: :cascade do |t|
    t.string "name"
  end

  create_table "trigrams", force: :cascade do |t|
    t.string  "trigram",     limit: 3
    t.integer "score",       limit: 2
    t.integer "owner_id"
    t.string  "owner_type"
    t.string  "fuzzy_field"
  end

  add_index "trigrams", ["owner_id", "owner_type", "fuzzy_field", "trigram", "score"], name: "index_for_match"
  add_index "trigrams", ["owner_id", "owner_type"], name: "index_by_owner"

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contract_id"
    t.string   "phone_number"
    t.string   "code"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true

end
