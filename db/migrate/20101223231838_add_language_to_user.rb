class AddLanguageToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :activeLanguage, :int
  end

  def self.down
    drop_column :users, :activeLanguage
  end
end
