class Case < ActiveRecord::Base
  has_many :lexemes
  
  def to_s
    value
  end
end
