class AddMetadataColsToLexeme < ActiveRecord::Migration
  def self.up
    add_column :lexemes, :pos_id, :integer
    add_column :lexemes, :tense_id, :integer
    add_column :lexemes, :aspect_id, :integer
    add_column :lexemes, :mood_id, :integer
    add_column :lexemes, :voice_id, :integer
    add_column :lexemes, :person_id, :integer
    add_column :lexemes, :number_id, :integer
    add_column :lexemes, :gender_id, :integer
    add_column :lexemes, :case_id, :integer
  end

  def self.down
    drop_column :lexemes, :pos_id
    drop_column :lexemes, :tense_id
    drop_column :lexemes, :aspect_id
    drop_column :lexemes, :mood_id
    drop_column :lexemes, :voice_id
    drop_column :lexemes, :person_id
    drop_column :lexemes, :number_id
    drop_column :lexemes, :gender_id
    drop_column :lexemes, :case_id
  end
end
