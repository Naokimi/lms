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

ActiveRecord::Schema.define(version: 2020_12_01_134808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.text "description"
    t.bigint "learning_module_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["learning_module_id"], name: "index_exercises_on_learning_module_id"
  end

  create_table "learning_modules", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "subscription", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "learning_playlists", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "tag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "playlist_modules", force: :cascade do |t|
    t.bigint "learning_module_id", null: false
    t.bigint "learning_playlist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["learning_module_id"], name: "index_playlist_modules_on_learning_module_id"
    t.index ["learning_playlist_id"], name: "index_playlist_modules_on_learning_playlist_id"
  end

  create_table "purchased_modules", force: :cascade do |t|
    t.bigint "learning_module_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["learning_module_id"], name: "index_purchased_modules_on_learning_module_id"
    t.index ["user_id"], name: "index_purchased_modules_on_user_id"
  end

  create_table "saved_playlists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "learning_playlist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["learning_playlist_id"], name: "index_saved_playlists_on_learning_playlist_id"
    t.index ["user_id"], name: "index_saved_playlists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.string "token"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin"
    t.integer "subscription", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "video_courses", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "video_url"
    t.bigint "learning_module_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["learning_module_id"], name: "index_video_courses_on_learning_module_id"
  end

  add_foreign_key "exercises", "learning_modules"
  add_foreign_key "playlist_modules", "learning_modules"
  add_foreign_key "playlist_modules", "learning_playlists"
  add_foreign_key "purchased_modules", "learning_modules"
  add_foreign_key "purchased_modules", "users"
  add_foreign_key "saved_playlists", "learning_playlists"
  add_foreign_key "saved_playlists", "users"
  add_foreign_key "video_courses", "learning_modules"
end
