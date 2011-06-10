class DropRepeatedFields < ActiveRecord::Migration
  def self.up

    remove_column :phrases, :ortography
    remove_column :phrases, :analysis
    remove_column :phrases, :gloss
    remove_column :phrases, :translation

    remove_column :stories, :ortography
    remove_column :stories, :analysis
    remove_column :stories, :gloss
    remove_column :stories, :translation
  
  end

  def self.down
    
    create_table :phrases do |t|
      t.string :ortography
      t.string :analysis
      t.string :gloss
      t.string :translation

      t.timestamps
    end
    
    create_table :stories do |t|
      t.string :ortography
      t.string :analysis
      t.string :gloss
      t.string :translation

      t.timestamps
    end

  end
end
