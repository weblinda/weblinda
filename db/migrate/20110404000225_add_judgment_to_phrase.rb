class AddJudgmentToPhrase < ActiveRecord::Migration
  def self.up
    add_column :phrases, :judgment, :string
  end

  def self.down
    drop_column :phrase, :judgment
  end
end
