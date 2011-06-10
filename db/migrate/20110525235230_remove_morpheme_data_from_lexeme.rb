class RemoveMorphemeDataFromLexeme < ActiveRecord::Migration
  def self.up
    remove_column :lexemes, :orthography
    remove_column :lexemes, :analysis
    remove_column :lexemes, :gloss
    remove_column :lexemes, :lexical_entry
  end

  def self.down
    add_column :lexemes, :orthography, :string
    add_column :lexemes, :analysis, :string
    add_column :lexemes, :gloss, :string
    add_column :lexemes, :lexical_entry, :string
  end
end
