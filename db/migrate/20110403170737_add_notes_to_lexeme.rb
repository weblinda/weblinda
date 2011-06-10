class AddNotesToLexeme < ActiveRecord::Migration
  def self.up
    add_column :lexemes, :notes, :text
  end

  def self.down
    drop_column :lexemes, :notes
  end
end
