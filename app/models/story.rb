class Story < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  
  belongs_to :language
  
  paginates_per 5
  
  has_many :phrase_stories, :dependent => :destroy
  has_many :phrases, :through => :phrase_stories, :order => 'phrase_stories.position'
end
