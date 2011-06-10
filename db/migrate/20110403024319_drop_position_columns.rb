class DropPositionColumns < ActiveRecord::Migration
  def self.up
    remove_column :lexemes, :phrase_id
    remove_column :lexemes, :position
    remove_column :phrases, :story_id
    remove_column :phrases, :position  
  end

  def self.down
    add_column :lexemes, :phrase_id, :int
    add_column :lexemes, :position, :int
    add_column :phrases, :story_id, :int
    add_column :phrases, :position, :int
  end
end
