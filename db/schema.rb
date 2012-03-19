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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120305001811) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "articles", :force => true do |t|
    t.integer  "headline_id"
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "issue_id"
    t.text     "body"
    t.boolean  "published"
    t.datetime "published_at"
    t.string   "title"
    t.string   "video_youtube_id", :limit => 50
    t.text     "header_html"
    t.integer  "legacy_id"
  end

  create_table "articles_authors", :id => false, :force => true do |t|
    t.integer "article_id", :null => false
    t.integer "author_id",  :null => false
  end

  create_table "authors", :force => true do |t|
    t.integer "user_id"
    t.string  "name"
    t.integer "legacy_id"
  end

  create_table "front_page_articles", :force => true do |t|
    t.integer  "article_id", :null => false
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.integer  "article_id",        :null => false
    t.string   "caption"
    t.string   "credit"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "issues", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photo_sets", :force => true do |t|
    t.text     "description"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "photo_set_id",      :null => false
    t.string   "caption"
    t.string   "credit"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "review_slots", :force => true do |t|
    t.string   "name"
    t.boolean  "requires_admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "revisions", :force => true do |t|
    t.integer  "article_id", :null => false
    t.integer  "author_id",  :null => false
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "priority",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",                          :default => false
    t.string   "encrypted_password", :limit => 128, :default => "",    :null => false
  end

  create_table "workflow_articles", :force => true do |t|
    t.integer  "article_id"
    t.string   "status_message"
    t.string   "name"
    t.text     "proposed_titles"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "locked_by"
  end

  create_table "workflow_comments", :force => true do |t|
    t.integer  "article_id", :null => false
    t.integer  "author_id",  :null => false
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workflow_reviews", :force => true do |t|
    t.integer  "review_slot_id", :null => false
    t.integer  "article_id",     :null => false
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id"
  end

  create_table "workflow_updates", :force => true do |t|
    t.integer  "article_id", :null => false
    t.integer  "author_id",  :null => false
    t.string   "updates"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
