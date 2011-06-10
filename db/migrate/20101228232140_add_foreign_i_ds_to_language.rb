class AddForeignIDsToLanguage < ActiveRecord::Migration
  def self.up
    add_column :phrases, :language_id, :int
    add_column :stories, :language_id, :int
  end

  def self.down
    drop_column :phrases, :language_id
    drop_column :stories, :language_id
  end
end
