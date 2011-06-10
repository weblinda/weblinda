class CreateMorphemeLexemes < ActiveRecord::Migration
  def self.up
    create_table :morpheme_lexemes do |t|
      t.integer :position
      t.integer :morpheme_id
      t.integer :lexeme_id
      t.timestamps
    end
    
    add_index :morpheme_lexemes, :position
    add_index :morpheme_lexemes, :morpheme_id
    add_index :morpheme_lexemes, :lexeme_id
  end

  def self.down
    drop_table :morpheme_lexemes
  end
end
