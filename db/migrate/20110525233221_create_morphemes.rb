class CreateMorphemes < ActiveRecord::Migration
  def self.up
    create_table :morphemes do |t|
      t.integer :language_id
      t.string :orthography
      t.string :gloss
      t.string :translation

      t.timestamps
    end
  end

  def self.down
    drop_table :morphemes
  end
end
