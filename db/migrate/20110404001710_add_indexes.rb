class AddIndexes < ActiveRecord::Migration
  def self.up
    add_index :lexeme_memberships, :position
    add_index :lexeme_memberships, :lexeme_id
    add_index :lexeme_memberships, :phrase_id
    
    add_index :lexemes, :language_id
    add_index :lexemes, :pos_id
    add_index :lexemes, :tense_id
    add_index :lexemes, :aspect_id
    add_index :lexemes, :mood_id
    add_index :lexemes, :voice_id
    add_index :lexemes, :person_id
    add_index :lexemes, :number_id
    add_index :lexemes, :gender_id
    add_index :lexemes, :case_id
    
    add_index :phrases, :language_id
    
    add_index :stories, :language_id
    
    add_index :users, :language_id
  end

  def self.down
    remove_index :lexeme_memberships, :position
    remove_index :lexeme_memberships, :lexeme_id
    remove_index :lexeme_memberships, :phrase_id
    
    remove_index :lexemes, :language_id
    remove_index :lexemes, :pos_id
    remove_index :lexemes, :tense_id
    remove_index :lexemes, :aspect_id
    remove_index :lexemes, :mood_id
    remove_index :lexemes, :voice_id
    remove_index :lexemes, :person_id
    remove_index :lexemes, :number_id
    remove_index :lexemes, :gender_id
    remove_index :lexemes, :case_id
    
    remove_index :phrases, :language_id
    
    remove_index :stories, :language_id
    
    remove_index :users, :language_id
    
  end
end
