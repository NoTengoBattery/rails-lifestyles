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

ActiveRecord::Schema.define(version: 2021_03_16_210003) do
  create_table "articles", force: :cascade do |t|
    t.integer "AuthorId", null: false
    t.string "Title", null: false
    t.text "Text", null: false
    t.string "Image", null: false
    t.date "CreatedAt", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["CreatedAt"], name: "index_articles_on_CreatedAt"
    t.index ["Title"], name: "index_articles_on_Title", unique: true
  end

  create_table "articles_categories", id: false, force: :cascade do |t|
    t.integer "article_id", null: false
    t.integer "category_id", null: false
    t.index ["article_id"], name: "index_articles_categories_on_article_id"
    t.index ["category_id"], name: "index_articles_categories_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "Name", null: false
    t.integer "Priority", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Name"], name: "index_categories_on_Name", unique: true
    t.index ["Priority"], name: "index_categories_on_Priority", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "Name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Name"], name: "index_users_on_Name", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.integer "ArticleId", null: false
    t.integer "UserId", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ArticleId"], name: "index_votes_on_ArticleId"
    t.index ["UserId"], name: "index_votes_on_UserId"
  end
end
