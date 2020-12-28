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

ActiveRecord::Schema.define(version: 2020_12_28_051933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "doctor_id"
    t.bigint "participant_id"
    t.string "slot"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["participant_id"], name: "index_appointments_on_participant_id"
  end

  create_table "arms", force: :cascade do |t|
    t.string "name"
    t.integer "limit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "clinic_id"
    t.index ["clinic_id"], name: "index_arms_on_clinic_id"
  end

  create_table "clinics", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clinics_doctors", force: :cascade do |t|
    t.bigint "clinic_id"
    t.bigint "doctor_id"
    t.index ["clinic_id"], name: "index_clinics_doctors_on_clinic_id"
    t.index ["doctor_id"], name: "index_clinics_doctors_on_doctor_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "specification"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "participants", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.bigint "arm_id"
    t.index ["arm_id"], name: "index_participants_on_arm_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name"
    t.string "site_uuid"
    t.string "location"
    t.string "phone"
    t.string "email"
    t.string "study_uuid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
