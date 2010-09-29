class <%= migration_class_name %> < ActiveRecord::Migration
  def self.up
    create_table :<%= table_name %> do |t|
      t.string  :locale
      t.string  :key
      t.text    :value
      t.boolean :is_proc, :default => false
      t.timestamps
    end
    
    add_index :<%= table_name %>, :locale
    add_index :<%= table_name %>, :key
  end

  def self.down
    drop_table :<%= table_name %>
  end
end