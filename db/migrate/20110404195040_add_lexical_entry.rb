class AddLexicalEntry < ActiveRecord::Migration
  def self.up
    add_column :lexemes, :lexical_entry, :string
  end

  def self.down
    drop_column :lexemes, :lexical_entry
  end
end
