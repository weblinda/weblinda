class AddValueToMetadataTables < ActiveRecord::Migration
  def self.up
    add_column :pos, :value, :string
    add_column :tenses, :value, :string
    add_column :aspects, :value, :string
    add_column :moods, :value, :string
    add_column :voices, :value, :string
    add_column :people, :value, :string
    add_column :numbers, :value, :string
    add_column :genders, :value, :string
    add_column :cases, :value, :string
  end

  def self.down
    drop_column :pos, :value
    drop_column :tenses, :value
    drop_column :aspects, :value
    drop_column :moods, :value
    drop_column :voices, :value
    drop_column :people, :value
    drop_column :numbers, :value
    drop_column :genders, :value
    drop_column :cases, :value
  end
end
