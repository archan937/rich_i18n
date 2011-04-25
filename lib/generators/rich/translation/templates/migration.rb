class <%= migration_class_name %> < ActiveRecord::Migration
  def self.up
    create_table :<%= table_name %> do |t|
      t.string   "key"
      t.text     "value"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index :<%= table_name %>, :key
  end

  def self.down
    drop_table :<%= table_name %>
  end
end