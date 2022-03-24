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

ActiveRecord::Schema.define(version: 2022_03_24_151305) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "modes", force: :cascade do |t|
    t.string "difficulty", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
  end

  create_table "sentences", force: :cascade do |t|
    t.string "boin", null: false
    t.string "normal", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "mode_id"
    t.index ["mode_id"], name: "index_sentences_on_mode_id"
  end

  add_foreign_key "sentences", "modes"
end
