class RenamePhraseStoryJoinTable < ActiveRecord::Migration
  def self.up
    rename_table :phrases_stories, :phrase_stories
  end

  def self.down
    rename_table :phrase_stories, :phrases_stories
  end
end
