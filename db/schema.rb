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

ActiveRecord::Schema[7.0].define(version: 2024_06_29_163103) do
  create_table "advices", charset: "utf8", force: :cascade do |t|
    t.integer "age_months", null: false
    t.text "advice", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "babies", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.date "birth_date", null: false
    t.float "height"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_babies_on_user_id"
  end

  create_table "diaper_changes", charset: "utf8", force: :cascade do |t|
    t.bigint "baby_id", null: false
    t.datetime "change_time", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["baby_id"], name: "index_diaper_changes_on_baby_id"
  end

  create_table "diaries", charset: "utf8", force: :cascade do |t|
    t.bigint "baby_id", null: false
    t.date "entry_date", null: false
    t.text "content", null: false
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["baby_id"], name: "index_diaries_on_baby_id"
  end

  create_table "feedings", charset: "utf8", force: :cascade do |t|
    t.bigint "baby_id", null: false
    t.datetime "feeding_time", null: false
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["baby_id"], name: "index_feedings_on_baby_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "babies", "users"
  add_foreign_key "diaper_changes", "babies"
  add_foreign_key "diaries", "babies"
  add_foreign_key "feedings", "babies"
end
