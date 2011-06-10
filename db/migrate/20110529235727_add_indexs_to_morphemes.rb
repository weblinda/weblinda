class AddIndexsToMorphemes < ActiveRecord::Migration
  def self.up
    add_index :morphemes, :language_id
    add_index :morphemes, :orthography
    add_index :morphemes, :lexical_entry
    add_index :morphemes, :gloss
    add_index :morphemes, :translation
  end

  def self.down
    remove_index :morphemes, :language_id
    remove_index :morphemes, :orthography
    remove_index :morphemes, :lexical_entry
    remove_index :morphemes, :gloss
    remove_index :morphemes, :translation
  end
end
