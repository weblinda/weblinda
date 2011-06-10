class PhraseStory < ActiveRecord::Base
  default_scope :order => 'position'
  
  belongs_to :phrase
  belongs_to :story
end
