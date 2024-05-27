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

ActiveRecord::Schema[7.0].define(version: 2024_05_27_014819) do
  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_authors", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_book_authors_on_author_id"
    t.index ["book_id"], name: "index_book_authors_on_book_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "systemid"
    t.string "published_date"
    t.string "image_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "child_read_records", force: :cascade do |t|
    t.integer "child_id", null: false
    t.integer "read_record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_child_read_records_on_child_id"
    t.index ["read_record_id"], name: "index_child_read_records_on_read_record_id"
  end

  create_table "children", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.date "birthday"
    t.integer "family_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_children_on_family_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "families", force: :cascade do |t|
    t.string "name"
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "read_record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["read_record_id"], name: "index_favorites_on_read_record_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "read_record_tags", force: :cascade do |t|
    t.integer "read_record_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["read_record_id"], name: "index_read_record_tags_on_read_record_id"
    t.index ["tag_id"], name: "index_read_record_tags_on_tag_id"
  end

  create_table "read_records", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "user_id", null: false
    t.text "body"
    t.date "read_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "family_id", null: false
    t.index ["book_id"], name: "index_read_records_on_book_id"
    t.index ["family_id"], name: "index_read_records_on_family_id"
    t.index ["user_id"], name: "index_read_records_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.integer "family_id"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.datetime "activation_sent_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "invite_token"
    t.index ["email"], name: "index_users_on_email"
    t.index ["family_id"], name: "index_users_on_family_id"
  end

  add_foreign_key "book_authors", "authors"
  add_foreign_key "book_authors", "books"
  add_foreign_key "books", "users"
  add_foreign_key "child_read_records", "children"
  add_foreign_key "child_read_records", "read_records"
  add_foreign_key "children", "families"
  add_foreign_key "favorites", "read_records"
  add_foreign_key "favorites", "users"
  add_foreign_key "read_record_tags", "read_records"
  add_foreign_key "read_record_tags", "tags"
  add_foreign_key "read_records", "books"
  add_foreign_key "read_records", "families"
  add_foreign_key "read_records", "users"
  add_foreign_key "users", "families"
end
