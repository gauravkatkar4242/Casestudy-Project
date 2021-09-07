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

ActiveRecord::Schema.define(version: 2021_08_27_090735) do

  create_table "assessor_responses", force: :cascade do |t|
    t.integer "question_trait_id", null: false
    t.integer "casestudy_user_id", null: false
    t.integer "user_id", null: false
    t.integer "assessor_id", null: false
    t.float "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assessor_id"], name: "index_assessor_responses_on_assessor_id"
    t.index ["casestudy_user_id"], name: "index_assessor_responses_on_casestudy_user_id"
    t.index ["question_trait_id"], name: "index_assessor_responses_on_question_trait_id"
    t.index ["user_id"], name: "index_assessor_responses_on_user_id"
  end

  create_table "casestudies", force: :cascade do |t|
    t.integer "duration"
    t.integer "scale"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "creator_id", null: false
    t.string "passkey"
    t.index ["creator_id"], name: "index_casestudies_on_creator_id"
  end

  create_table "casestudy_users", force: :cascade do |t|
    t.integer "casestudy_id", null: false
    t.integer "user_id", null: false
    t.integer "assessor_id", null: false
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "started_time"
    t.datetime "completed_time"
    t.integer "time_elapsed"
    t.index ["assessor_id"], name: "index_casestudy_users_on_assessor_id"
    t.index ["casestudy_id"], name: "index_casestudy_users_on_casestudy_id"
    t.index ["user_id"], name: "index_casestudy_users_on_user_id"
  end

  create_table "pages", force: :cascade do |t|
    t.integer "casestudy_id", null: false
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["casestudy_id"], name: "index_pages_on_casestudy_id"
  end

  create_table "question_traits", force: :cascade do |t|
    t.integer "trait_id", null: false
    t.integer "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_question_traits_on_question_id"
    t.index ["trait_id"], name: "index_question_traits_on_trait_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "casestudy_id", null: false
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["casestudy_id"], name: "index_questions_on_casestudy_id"
  end

  create_table "role_users", force: :cascade do |t|
    t.integer "role_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_role_users_on_role_id"
    t.index ["user_id"], name: "index_role_users_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "traits", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_responses", force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "casestudy_user_id", null: false
    t.integer "user_id", null: false
    t.text "response"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["casestudy_user_id"], name: "index_user_responses_on_casestudy_user_id"
    t.index ["question_id"], name: "index_user_responses_on_question_id"
    t.index ["user_id"], name: "index_user_responses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assessor_responses", "casestudy_users"
  add_foreign_key "assessor_responses", "question_traits"
  add_foreign_key "assessor_responses", "users"
  add_foreign_key "assessor_responses", "users", column: "assessor_id"
  add_foreign_key "casestudies", "users", column: "creator_id"
  add_foreign_key "casestudy_users", "casestudies"
  add_foreign_key "casestudy_users", "users"
  add_foreign_key "casestudy_users", "users", column: "assessor_id"
  add_foreign_key "pages", "casestudies"
  add_foreign_key "question_traits", "questions"
  add_foreign_key "question_traits", "traits"
  add_foreign_key "questions", "casestudies"
  add_foreign_key "role_users", "roles"
  add_foreign_key "role_users", "users"
  add_foreign_key "user_responses", "casestudy_users"
  add_foreign_key "user_responses", "questions"
  add_foreign_key "user_responses", "users"
end
