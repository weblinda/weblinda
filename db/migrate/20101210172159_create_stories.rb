class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.string :ortography
      t.string :analysis
      t.string :gloss
      t.string :translation

      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end
