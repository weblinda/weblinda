class AddCachedSlugToLanguages < ActiveRecord::Migration
  def self.up
    add_column :languages, :cached_slug, :string
    add_index :languages, :cached_slug, :unique => true
  end

  def self.down
    remove_column :languages, :cached_slug
  end
end
