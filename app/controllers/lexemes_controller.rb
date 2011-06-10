class LexemesController < ApplicationController
  inherit_resources
  belongs_to :language  
 
  before_filter :require_user, :require_current_language
  
  def index
    @lexemes = current_language.lexemes.page params[:page] 
    
    respond_to do |format|
      format.html
      format.json { render :json => @lexemes }
    end
  end

  def show
    @lexeme = Lexeme.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json { render :json => @lexeme }
    end
  end

  def new
    @lexeme = Lexeme.new
    @lexeme.morpheme_lexemes.build.build_morpheme
  end

  def edit
    @lexeme = Lexeme.find(params[:id])
  end

  def create
    @lexeme = Lexeme.new(params[:lexeme])
    @lexeme.language = current_language
    @lexeme.lexeme_input = { :orthography => params[:orthography], :lexical_entry => params[:lexical_entry], :gloss => params[:gloss], :translation => params[:translation]}
    
    if @lexeme.save
      @lexeme.morphemes.each do |morpheme|
        morpheme.language = current_language
        morpheme.save!
      end
        
      redirect_to(language_lexeme_path(@lexeme.language, @lexeme), :notice => 'Lexeme was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @lexeme = Lexeme.find(params[:id])

    if @lexeme.update_attributes(params[:lexeme])
      redirect_to(language_lexeme_path(@lexeme.language, @lexeme), :notice => 'Lexeme was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    Lexeme.find(params[:id]).destroy
    redirect_to(lexemes_url)
  end
end
