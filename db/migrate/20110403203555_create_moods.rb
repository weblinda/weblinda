class CreateMoods < ActiveRecord::Migration
  def self.up
    create_table :moods do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :moods
  end
end
