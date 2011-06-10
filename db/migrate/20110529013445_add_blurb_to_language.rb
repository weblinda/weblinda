class AddBlurbToLanguage < ActiveRecord::Migration
  def self.up
    add_column :languages, :blurb, :text
  end

  def self.down
    remove_column :languages, :blurb
  end
end
