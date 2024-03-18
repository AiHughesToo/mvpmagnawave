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

ActiveRecord::Schema.define(version: 2024_03_18_150309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievemnets", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "image_link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "announcements", force: :cascade do |t|
    t.string "part_one"
    t.string "part_two"
    t.string "part_three"
    t.string "wfl"
    t.string "bdays"
    t.string "anniversarys"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mvpwins", force: :cascade do |t|
    t.string "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "winner_ids", default: [], array: true
  end

  create_table "nominations", force: :cascade do |t|
    t.string "nom_type"
    t.integer "sender_id"
    t.string "sender_name"
    t.integer "user_id"
    t.string "receiver_name"
    t.string "receiver_img_link"
    t.string "nom_body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stats", force: :cascade do |t|
    t.integer "user_id"
    t.integer "noms_sent", default: 0
    t.integer "noms_received", default: 0
    t.integer "mvp_wins", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "so_sent", default: 0
    t.integer "so_received", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.string "first_name"
    t.string "last_name"
    t.integer "stat_id"
    t.string "image_link"
    t.boolean "mvp_sent", default: false
    t.integer "achievements", default: [], array: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
