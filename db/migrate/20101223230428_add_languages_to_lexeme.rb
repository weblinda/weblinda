class AddLanguagesToLexeme < ActiveRecord::Migration
  def self.up
    add_column :lexemes, :language_id, :int
  end

  def self.down
    drop_column :lexemes, :language_id
  end
end
