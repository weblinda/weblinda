class Lexeme < ActiveRecord::Base
  paginates_per 10
    
  belongs_to :language

  has_many :morpheme_lexemes, :dependent => :destroy
  has_many :morphemes, :through => :morpheme_lexemes, :order => 'morpheme_lexemes.position'

  has_many :lexeme_phrases, :dependent => :destroy
  has_many :phrases, :through => :lexeme_phrases, :order => 'lexeme_phrases.position'
  
  # lexeme metadata
  belongs_to :pos
  belongs_to :tense
  belongs_to :aspect
  belongs_to :mood
  belongs_to :voice
  belongs_to :person
  belongs_to :number
  belongs_to :gender
  belongs_to :case
  
  include Tanker
  tankit 'lexemes' do
    indexes :id
    indexes :language
    indexes :free_translation

    indexes :orthography do
      morphemes.map(&:orthography)
    end
    
    indexes :lexical_entry do
      morphemes.map(&:lexical_entry)
    end
    
    indexes :gloss do
      morphemes.map(&:gloss)
    end
    
    indexes :translation do
      morphemes.map(&:translation)
    end
  end

  after_save :update_tank_indexes
  after_destroy :delete_tank_indexes

  def self.identify_morphemes(orthography, lexical_entry, gloss, translation)
    orthography = orthography.split '-'
    lexical_entry = lexical_entry.split '-'
    gloss = gloss.split '-'
    translation = translation.split '-'
    
    morphemes = []
    orthography.zip(lexical_entry, gloss, translation) do |o, l, g, t|
      m = Morpheme.where(:orthography => o, :lexical_entry => l, :gloss => g, :translation => t)
      morphemes << m.first unless m.empty?
    end
    
    return morphemes
  end
  
  def self.identify_from_morphemes(morphemes)
    collective = morphemes.map(&:lexemes)
    collective.reduce(&:&)
    
    if collective.empty? then
      nil
    else
      collective.first.first
    end
  end
  
  def lexeme_input=(lexeme_in)
    if self.new_record?
      @lexeme_in = lexeme_in
    else
      self.create_morphemes(lexeme_in)
    end
  end

  def after_create
    self.lexeme_input = @lexeme_in if @lexeme_in
  end 

  def create_morphemes(lexeme)
    orthography = lexeme[:orthography].split '-'
    lexical_entry = lexeme[:lexical_entry].split '-'
    gloss = lexeme[:gloss].split '-'
    translation = lexeme[:translation].split '-'
    
    orthography.zip(lexical_entry, gloss, translation, (0..orthography.size).to_a) do |o, l, g, t, i|
      m = Morpheme.where(:orthography => o, :lexical_entry => l, :gloss => g, :translation => t, :language_id => self.language.id).first
      m = Morpheme.create(:orthography => o, :lexical_entry => l, :gloss => g, :translation => t, :language => self.language) unless m
      
      MorphemeLexeme.create(:position => i, :morpheme_id => m.id, :lexeme_id => self.id)
    end
  end
  
end
