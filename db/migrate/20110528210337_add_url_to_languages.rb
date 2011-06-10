class AddUrlToLanguages < ActiveRecord::Migration
  def self.up
    add_column :languages, :url, :string
  end

  def self.down
    remove_column :languages, :url
  end
end
