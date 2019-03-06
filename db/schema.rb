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

ActiveRecord::Schema.define(version: 2019_03_05_234928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: :cascade do |t|
    t.integer "badge_points"
    t.string "badge_name"
    t.string "icon_name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "challenges", force: :cascade do |t|
    t.date "start_date"
    t.integer "duration_days"
    t.integer "cost"
    t.string "photo_url"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "title"
    t.text "description"
    t.index ["user_id"], name: "index_challenges_on_user_id"
  end

  create_table "daily_goal_tasks", force: :cascade do |t|
    t.string "description"
    t.bigint "daily_goal_id"
    t.integer "task_points", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["daily_goal_id"], name: "index_daily_goal_tasks_on_daily_goal_id"
  end

  create_table "daily_goals", force: :cascade do |t|
    t.bigint "challenge_id"
    t.integer "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_daily_goals_on_challenge_id"
  end

  create_table "participant_badges", force: :cascade do |t|
    t.bigint "badge_id"
    t.bigint "participant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["badge_id"], name: "index_participant_badges_on_badge_id"
    t.index ["participant_id"], name: "index_participant_badges_on_participant_id"
  end

  create_table "participant_photos", force: :cascade do |t|
    t.string "photo_url"
    t.bigint "participant_id"
    t.bigint "daily_goal_task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["daily_goal_task_id"], name: "index_participant_photos_on_daily_goal_task_id"
    t.index ["participant_id"], name: "index_participant_photos_on_participant_id"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "challenge_id"
    t.integer "total_points", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_participants_on_challenge_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "task_results", force: :cascade do |t|
    t.bigint "participant_id"
    t.bigint "daily_goal_task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "complete", default: false
    t.index ["daily_goal_task_id"], name: "index_task_results_on_daily_goal_task_id"
    t.index ["participant_id"], name: "index_task_results_on_participant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "handle"
    t.boolean "influencer", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "challenges", "users"
  add_foreign_key "daily_goal_tasks", "daily_goals"
  add_foreign_key "daily_goals", "challenges"
  add_foreign_key "participant_badges", "badges"
  add_foreign_key "participant_badges", "participants"
  add_foreign_key "participant_photos", "daily_goal_tasks"
  add_foreign_key "participant_photos", "participants"
  add_foreign_key "participants", "challenges"
  add_foreign_key "participants", "users"
  add_foreign_key "task_results", "daily_goal_tasks"
  add_foreign_key "task_results", "participants"
end
