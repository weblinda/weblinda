class MorphemeLexeme < ActiveRecord::Base
  default_scope :order => 'position'
  
  belongs_to :morpheme
  belongs_to :lexeme
end
