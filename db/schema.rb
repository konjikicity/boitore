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

ActiveRecord::Schema.define(version: 2022_06_17_105436) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "modes", force: :cascade do |t|
    t.string "difficulty", limit: 10, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description", limit: 30, null: false
    t.index ["difficulty"], name: "index_modes_on_difficulty", unique: true
  end

  create_table "play_results", force: :cascade do |t|
    t.string "practiced_sentence", null: false
    t.string "practiced_normal", null: false
    t.string "practiced_boin", null: false
    t.string "normal_voice", null: false
    t.string "boin_voice", null: false
    t.string "judge", null: false
    t.integer "score", null: false
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_play_results_on_user_id"
  end

  create_table "sentences", force: :cascade do |t|
    t.string "boin", limit: 20, null: false
    t.string "normal", limit: 20, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "mode_id"
    t.index ["boin"], name: "index_sentences_on_boin", unique: true
    t.index ["mode_id"], name: "index_sentences_on_mode_id"
    t.index ["normal"], name: "index_sentences_on_normal", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", limit: 50, null: false
    t.string "email", null: false
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nickname", limit: 50
    t.string "image"
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "play_results", "users"
  add_foreign_key "sentences", "modes"
end
