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

ActiveRecord::Schema[7.0].define(version: 2023_03_17_181340) do
  create_table "quests", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scenes", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "quest_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quest_id"], name: "index_scenes_on_quest_id"
  end

  create_table "steps", force: :cascade do |t|
    t.string "choice"
    t.integer "source_scene_id", null: false
    t.integer "target_scene_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_scene_id"], name: "index_steps_on_source_scene_id"
    t.index ["target_scene_id"], name: "index_steps_on_target_scene_id"
  end

  add_foreign_key "scenes", "quests"
  add_foreign_key "steps", "scenes", column: "source_scene_id"
  add_foreign_key "steps", "scenes", column: "target_scene_id"
end
