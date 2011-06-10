class RenameUserActiveLanguage < ActiveRecord::Migration
  def self.up
    add_column :users, :language_id, :int
    remove_column :users, :activeLanguage
  end

  def self.down
    add_column :users, :activeLanguage, :int
    drop_column :users, :language_id
  end
end
