class LanguageController < ApplicationController
  inherit_resources
  
  def show()
    @language = Language.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json { render :json => @language }
    end
  end
  
  def search()
    if params[:q]
      @morphemes = Morpheme.search_tank(params[:q])
      @lexemes = Lexeme.search_tank(params[:q])
      @phrases = Phrase.search_tank(params[:q])
    end
    
    respond_to do |format|
      format.html
    end
  end
end