class AddNameToStory < ActiveRecord::Migration
  def self.up
    add_column :stories, :name, :string
  end

  def self.down
    drop_column :stories, :name
  end
end
