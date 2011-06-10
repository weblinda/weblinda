class LexemeMembershipRename < ActiveRecord::Migration
  def self.up
    rename_table 'lexeme_memberships', 'lexeme_phrases'
  end

  def self.down
    rename_table 'lexeme_phrases', 'lexeme_memberships'
  end
end
