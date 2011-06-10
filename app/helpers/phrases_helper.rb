module PhrasesHelper
  def phraseClass(taggable)
    if taggable then
      'entry taggable'
    else
      'entry'
    end
  end
end
