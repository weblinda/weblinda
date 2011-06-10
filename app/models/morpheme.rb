class Morpheme < ActiveRecord::Base
  paginates_per 10
    
  belongs_to :language
  
  has_many :morpheme_lexemes, :dependent => :destroy
  has_many :lexemes, :through => :morpheme_lexemes, :order => 'morpheme_lexemes.position'
  
  include Tanker
  tankit 'morphemes' do
    indexes :id
    indexes :language
    indexes :orthography
    indexes :lexical_entry
    indexes :gloss
    indexes :translation
  end
  
  after_save :update_tank_indexes
  after_destroy :delete_tank_indexes
end
