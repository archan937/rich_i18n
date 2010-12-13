ActiveRecord::Schema.define do

  create_table "translations", :force => true do |t|
    t.string   "locale"
    t.string   "key"
    t.text     "value"
    t.boolean  "is_proc",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "translations", ["key"], :name => "index_translations_on_key"
  add_index "translations", ["locale"], :name => "index_translations_on_locale"

end