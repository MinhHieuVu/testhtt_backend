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

ActiveRecord::Schema.define(version: 2022_01_27_155328) do

  create_table "action_text_rich_texts", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.text "body", size: :long
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "group_category_id"
    t.string "slug"
    t.integer "position"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_category_id"], name: "index_categories_on_group_category_id"
    t.index ["lft"], name: "index_categories_on_lft"
    t.index ["name"], name: "index_categories_on_name"
    t.index ["parent_id"], name: "index_categories_on_parent_id"
    t.index ["rgt"], name: "index_categories_on_rgt"
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "group_categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "position"
    t.string "avatar"
    t.string "cover"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "group_questions", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "content", size: :medium
    t.text "guide"
    t.text "transcript"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
    t.bigint "test_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lft"], name: "index_group_questions_on_lft"
    t.index ["parent_id"], name: "index_group_questions_on_parent_id"
    t.index ["rgt"], name: "index_group_questions_on_rgt"
    t.index ["test_id"], name: "index_group_questions_on_test_id"
    t.index ["user_id"], name: "index_group_questions_on_user_id"
  end

  create_table "question_options", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "question_id"
    t.text "content", size: :medium
    t.boolean "is_answer"
    t.text "explanation", size: :medium
    t.integer "position"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_question_options_on_question_id"
    t.index ["user_id"], name: "index_question_options_on_user_id"
  end

  create_table "questions", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "group_question_id"
    t.integer "question_number"
    t.string "name"
    t.text "content", size: :medium
    t.text "explanation", size: :medium
    t.text "answer"
    t.integer "difficulty"
    t.float "score"
    t.integer "status", default: 0
    t.boolean "is_swap"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_question_id"], name: "index_questions_on_group_question_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "tests", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "difficulty"
    t.integer "attempt_times"
    t.datetime "open_time"
    t.datetime "close_time"
    t.datetime "release_time"
    t.integer "duration"
    t.integer "status", default: 0
    t.string "slug"
    t.integer "position"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_tests_on_name"
    t.index ["user_id"], name: "index_tests_on_user_id"
  end

  create_table "tests_categories", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "test_id"
    t.bigint "category_id"
    t.integer "position"
    t.index ["category_id"], name: "index_tests_categories_on_category_id"
    t.index ["test_id"], name: "index_tests_categories_on_test_id"
  end

  create_table "user_take_tests", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "test_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "score"
    t.integer "correct_number"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["test_id"], name: "index_user_take_tests_on_test_id"
    t.index ["user_id"], name: "index_user_take_tests_on_user_id"
  end

  create_table "user_test_responses", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_take_test_id"
    t.bigint "question_id"
    t.string "answer"
    t.bigint "question_option_id"
    t.boolean "is_correct"
    t.integer "difficulty"
    t.integer "score"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_user_test_responses_on_question_id"
    t.index ["question_option_id"], name: "index_user_test_responses_on_question_option_id"
    t.index ["user_id"], name: "index_user_test_responses_on_user_id"
    t.index ["user_take_test_id"], name: "index_user_test_responses_on_user_take_test_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
