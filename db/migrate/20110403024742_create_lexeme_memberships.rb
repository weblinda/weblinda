class CreateLexemeMemberships < ActiveRecord::Migration
  def self.up
    create_table :lexeme_memberships do |t|
      t.integer :position
      t.integer :phrase_id
      t.integer :lexeme_id
      t.timestamps
    end
  end

  def self.down
    drop_table :lexeme_memberships
  end
end
