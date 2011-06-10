class CreatePhrasesStories < ActiveRecord::Migration
  def self.up
    create_table :phrases_stories do |t|
      t.integer :position
      t.integer :phrase_id
      t.integer :story_id
      t.timestamps
    end
    
    add_index :phrases_stories, :position
    add_index :phrases_stories, :phrase_id
    add_index :phrases_stories, :story_id
  end

  def self.down
    drop_table :phrases_stories
  end
end
