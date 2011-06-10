class AddLexicalEntryToMorpheme < ActiveRecord::Migration
  def self.up
    add_column :morphemes, :lexical_entry, :string
  end

  def self.down
    drop_column :morphemes, :lexical_entry
  end
end
