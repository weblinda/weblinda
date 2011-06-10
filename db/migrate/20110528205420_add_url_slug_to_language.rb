class AddUrlSlugToLanguage < ActiveRecord::Migration
  def self.up
    add_column :languages, :url_slug, :string
  end

  def self.down
    remove_column :languages, :url_slug
  end
end
