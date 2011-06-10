class Removeurlslug < ActiveRecord::Migration
  def self.up
    remove_column :languages, :url_slug
  end

  def self.down
    add_column :languages, :url_slug, :string
  end
end
