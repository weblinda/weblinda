class CreateTenses < ActiveRecord::Migration
  def self.up
    create_table :tenses do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :tenses
  end
end
