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

ActiveRecord::Schema[8.1].define(version: 2026_05_19_202214) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "choices", force: :cascade do |t|
    t.string "choice_identifier", null: false
    t.jsonb "conditions_json", default: {}, null: false
    t.datetime "created_at", null: false
    t.jsonb "effects_json", default: {}, null: false
    t.string "failure_slug"
    t.string "risk_level", default: "low", null: false
    t.string "roll_type"
    t.bigint "room_id", null: false
    t.string "success_slug"
    t.string "target_room_slug", null: false
    t.string "text", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id", "choice_identifier"], name: "index_choices_on_room_id_and_choice_identifier", unique: true
    t.index ["room_id"], name: "index_choices_on_room_id"
  end

  create_table "facts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "reviewer_id", null: false
    t.string "source", null: false
    t.text "text", null: false
    t.datetime "updated_at", null: false
    t.datetime "verified_at"
  end

  create_table "players", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.jsonb "inventory_json", default: [], null: false
    t.string "name", null: false
    t.jsonb "reputation_json", default: {}, null: false
    t.bigint "room_id"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["room_id"], name: "index_players_on_room_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "rolls", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "player_id", null: false
    t.integer "result", null: false
    t.string "roll_type", null: false
    t.string "seed", null: false
    t.string "signature_token", null: false
    t.datetime "updated_at", null: false
    t.boolean "verified", default: false, null: false
    t.index ["player_id"], name: "index_rolls_on_player_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description_md", null: false
    t.jsonb "metadata_json", default: {}, null: false
    t.string "slug", null: false
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_rooms_on_slug", unique: true
  end

  add_foreign_key "choices", "rooms"
  add_foreign_key "players", "rooms"
  add_foreign_key "rolls", "players"
end
