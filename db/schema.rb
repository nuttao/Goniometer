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

ActiveRecord::Schema.define(version: 20140520084642) do

  create_table "body_parts", force: true do |t|
    t.string   "name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instructions", force: true do |t|
    t.integer  "motion_id"
    t.string   "name"
    t.text     "description"
    t.integer  "axis_mode"
    t.integer  "order_no"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "instructions", ["motion_id"], name: "index_instructions_on_motion_id"

  create_table "measure_results", force: true do |t|
    t.integer  "measure_id"
    t.integer  "order_no"
    t.string   "name"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "measure_results", ["measure_id"], name: "index_measure_results_on_measure_id"

  create_table "measures", force: true do |t|
    t.integer  "user_id"
    t.integer  "measure_mode"
    t.integer  "patient_id"
    t.text     "description"
    t.datetime "measured_at"
    t.integer  "body_part_id"
    t.integer  "motion_id"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "measures", ["body_part_id"], name: "index_measures_on_body_part_id"
  add_index "measures", ["motion_id"], name: "index_measures_on_motion_id"
  add_index "measures", ["patient_id"], name: "index_measures_on_patient_id"
  add_index "measures", ["user_id"], name: "index_measures_on_user_id"

  create_table "motions", force: true do |t|
    t.integer  "body_part_id"
    t.string   "name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "motions", ["body_part_id"], name: "index_motions_on_body_part_id"

  create_table "patients", force: true do |t|
    t.string   "name"
    t.string   "gender"
    t.integer  "age"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patients", ["user_id"], name: "index_patients_on_user_id"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.integer  "user_id"
    t.string   "client_uid"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "crypted_password"
    t.string   "email"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["role_id"], name: "index_users_on_role_id"

end
