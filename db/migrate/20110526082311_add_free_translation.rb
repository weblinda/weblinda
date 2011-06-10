class AddFreeTranslation < ActiveRecord::Migration
  def self.up
    rename_column :lexemes, :translation, :free_translation
    add_column :phrases, :free_translation, :string
  end

  def self.down
    rename_column :lexemes, :free_translation, :translation
    remove_column :phrases, :free_translation
  end
end
