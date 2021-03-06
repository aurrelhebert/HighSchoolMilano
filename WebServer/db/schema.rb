# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140708122426) do

  create_table "books", force: true do |t|
    t.string   "title"
    t.text     "desc"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author"
    t.string   "town"
    t.string   "editor"
    t.string   "collection"
    t.integer  "year"
  end

  add_index "books", ["course_id"], name: "index_books_on_course_id"

  create_table "courses", force: true do |t|
    t.string   "title"
    t.text     "desc"
    t.integer  "startingHour"
    t.integer  "finishHour"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "year"
    t.integer  "formation_id"
    t.integer  "day"
    t.text     "program"
    t.string   "avatar"
  end

  add_index "courses", ["formation_id"], name: "index_courses_on_formation_id"

  create_table "courses_teachers", id: false, force: true do |t|
    t.integer "course_id"
    t.integer "teacher_id"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: true do |t|
    t.string   "firstName"
    t.string   "name"
    t.string   "desk"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.string   "cv"
  end

  create_table "timetables", force: true do |t|
    t.integer  "hour"
    t.integer  "day"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "room"
    t.string   "course_title"
  end

  add_index "timetables", ["course_id"], name: "index_timetables_on_course_id"

end
