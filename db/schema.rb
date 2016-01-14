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

ActiveRecord::Schema.define(version: 20160114161028) do

  create_table "episodes", force: :cascade do |t|
    t.integer  "season_id"
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "episodes", ["season_id"], name: "index_episodes_on_season_id"

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.text     "plot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies_purchase_options", id: false, force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "purchase_option_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "movies_purchase_options", ["movie_id"], name: "index_movies_purchase_options_on_movie_id"
  add_index "movies_purchase_options", ["purchase_option_id"], name: "index_movies_purchase_options_on_purchase_option_id"

  create_table "purchase_options", force: :cascade do |t|
    t.decimal  "price"
    t.string   "video_quality"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.string   "title"
    t.text     "plot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons_purchase_options", id: false, force: :cascade do |t|
    t.integer  "season_id"
    t.integer  "purchase_option_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "seasons_purchase_options", ["purchase_option_id"], name: "index_seasons_purchase_options_on_purchase_option_id"
  add_index "seasons_purchase_options", ["season_id"], name: "index_seasons_purchase_options_on_season_id"

end
