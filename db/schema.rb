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

ActiveRecord::Schema.define(version: 2019_10_05_021704) do



  create_table "libraries", force: :cascade do |t|
    t.string "l_name"
    t.string "l_location"
    t.integer "l_max_days"
    t.string "l_university"
    t.float "l_fine"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  create_table "books", force: :cascade do |t|
    t.string "b_title"
    t.string "b_author"
    t.string "b_lang"
    t.datetime "b_pub"
    t.float "b_edition"
    t.text "b_image"
    t.string "b_subject"
    t.text "b_summary"
    t.boolean "b_spl"
    t.integer "Library_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "available"
    t.index ["Library_id"], name: "index_books_on_Library_id"
  end
  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "user_type", default: "student"
    t.string "u_name"
    t.integer "library_id"
    t.boolean "l_approved"
    t.string "s_education"
    t.integer "s_max"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["library_id"], name: "index_users_on_library_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
  create_table "reservations", force: :cascade do |t|
    t.integer "User_id"
    t.integer "Book_id"
    t.datetime "t_borrow"
    t.datetime "d_return"
    t.string "status"
    t.boolean "bookmark"
    t.float "fine_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Book_id"], name: "index_reservations_on_Book_id"
    t.index ["User_id"], name: "index_reservations_on_User_id"
  end



end
