class Phrase < ActiveRecord::Base
  paginates_per 5
  
  belongs_to :language
  
  has_many :lexeme_phrases, :dependent => :destroy
  has_many :lexemes, :order => 'lexeme_phrases.position', :through => :lexeme_phrases
  
  has_many :phrase_stories, :dependent => :destroy
  has_many :stories, :order => 'phrase_stories.position', :through => :phrase_stories
  
  include Tanker
  tankit 'phrases' do
    indexes :id
    indexes :language
    indexes :free_translation
    indexes :judgment

    indexes :orthography do
      ret = []
      lexemes.each do |lexeme|
        ret << lexeme.morphemes.map(&:orthography)
      end
      ret
    end
    
    indexes :lexical_entry do
      ret = []
      lexemes.each do |lexeme|
        ret << lexeme.morphemes.map(&:lexical_entry)
      end
      ret
    end
    
    indexes :gloss do
      ret = []
      lexemes.each do |lexeme|
        ret << lexeme.morphemes.map(&:gloss)
      end
      ret
    end
    
    indexes :translation do
      ret = []
      lexemes.each do |lexeme|
        ret << lexeme.morphemes.map(&:translation)
      end
      ret
    end
  end
  
  after_save :update_tank_indexes
  after_destroy :delete_tank_indexes
  
  def phrase_input=(phrase_in)
    if self.new_record?
      @phrase_in = phrase_in
    else
      self.create_lexemes(phrase_in)
    end
  end

  def after_create
    self.phrase_in = @phrase_in if @phrase_in
  end 

  def create_lexemes(phrase)
    orthography = phrase[:orthography].split ' '
    lexical_entry = phrase[:lexical_entry].split ' '
    gloss = phrase[:gloss].split ' '
    translation = phrase[:translation].split ' '
    
    orthography.zip(lexical_entry, gloss, translation, (0..orthography.size).to_a) do |o, l, g, t, i|
      lexeme = Lexeme.identify_from_morphemes(Lexeme.identify_morphemes(o, l, g, t))
      if not lexeme then
        lexeme = Lexeme.create(:language => self.language) unless lexeme
        lexeme.lexeme_input = { :orthography => o, :lexical_entry => l, :gloss => g, :translation => t }
      end
      
      LexemePhrase.create(:phrase_id => self.id, :lexeme_id => lexeme.id, :position => i)
    end
  end
end
