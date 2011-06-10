class CreateLexemes < ActiveRecord::Migration
  def self.up
    create_table :lexemes do |t|
      t.string :orthography
      t.string :analysis
      t.string :gloss
      t.string :translation

      t.timestamps
    end
  end

  def self.down
    drop_table :lexemes
  end
end
