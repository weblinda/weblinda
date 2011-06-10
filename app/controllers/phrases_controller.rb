class PhrasesController < ApplicationController
  inherit_resources
  belongs_to :language  
  
  before_filter :require_user, :require_current_language  

  def index
    @phrases = current_language.phrases.page params[:page]
    
    respond_to do |format|
      format.html
      format.json { render :json => @phrases }
    end
  end

  def show
    @phrase = Phrase.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @phrase }
    end
  end

  def new
    @phrase = Phrase.new
  
    respond_to do |format|
      format.html
    end
  end

  def edit
    @phrase = Phrase.find(params[:id])
  end

  def create
    @phrase = Phrase.create(:language_id => current_language, :judgment => params[:judgment])
    @phrase.phrase_input = { :orthography => params[:orthography], :lexical_entry => params[:lexical_entry], :gloss => params[:gloss], :translation => params[:translation]}

    redirect_to(language_phrase_path(@phrase.language, @phrase), :notice => 'Phrase was successfully created.')
  end

  def update
    @phrase = Phrase.find(params[:id])

    respond_to do |format|
      if @phrase.update_attributes(params[:phrase])
        format.html { redirect_to(language_phrase_path(@phrase.language, @phrase), :notice => 'Phrase was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @phrase = Phrase.find(params[:id])
    @phrase.destroy

    respond_to do |format|
      format.html { redirect_to(phrases_url) }
    end
  end
end
