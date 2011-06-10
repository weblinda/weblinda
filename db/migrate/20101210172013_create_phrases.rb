class CreatePhrases < ActiveRecord::Migration
  def self.up
    create_table :phrases do |t|
      t.string :ortography
      t.string :analysis
      t.string :gloss
      t.string :translation

      t.timestamps
    end
  end

  def self.down
    drop_table :phrases
  end
end
