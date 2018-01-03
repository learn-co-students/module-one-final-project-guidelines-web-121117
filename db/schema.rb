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

ActiveRecord::Schema.define(version: 11) do

  create_table "allegiances", force: :cascade do |t|
    t.integer "character_id"
    t.integer "house_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "total_pages"
    t.string "release_date"
  end

  create_table "character_books", force: :cascade do |t|
    t.integer "book_id"
    t.integer "character_id"
  end

  create_table "character_seasons", force: :cascade do |t|
    t.integer "season_id"
    t.integer "character_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "gender"
    t.string "birth_date"
    t.string "death_date"
    t.string "aliases"
    t.string "actor"
  end

  create_table "houses", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.integer "region_id"
    t.string "current_lord"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "name"
  end

end
