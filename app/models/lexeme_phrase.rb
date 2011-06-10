class LexemePhrase < ActiveRecord::Base
  default_scope :order => 'position'
  
  belongs_to :lexeme
  belongs_to :phrase
end
