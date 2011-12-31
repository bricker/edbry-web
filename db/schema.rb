# encoding: UTF-8
ActiveRecord::Schema.define(:version => 20111210033620) do

  create_table "attachments", :force => true do |t|
    t.string   "attachable_type"
    t.integer  "attachable_id"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "text_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.text     "information"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.datetime "password_reset_requested_at"
    t.string   "password_reset_token"
  end

end
