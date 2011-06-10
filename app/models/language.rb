class Language < ActiveRecord::Base
  has_friendly_id :url, :use_slug => true
  
  has_many :morphemes, :order => 'id asc'
  has_many :lexemes, :order => 'id asc'
  has_many :phrases, :order => 'id asc'
  has_many :stories, :order => 'id asc'
  
  def to_s
    name
  end
end
