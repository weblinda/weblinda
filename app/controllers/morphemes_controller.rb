class MorphemesController < ApplicationController
  inherit_resources
  belongs_to :language  
 
  before_filter :require_user, :require_current_language
  
  def index
    @morphemes = current_language.morphemes.page params[:page] 
    
    respond_to do |format|
      format.html
      format.json { render :json => @morphemes }
    end
  end

  def show
    @morpheme = Morpheme.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json { render :json => @morpheme }
    end
  end

  def new
    @morpheme = Morpheme.new
  end

  def edit
    @morpheme = Morpheme.find(params[:id])
  end

  def create
    @morpheme = Morpheme.new(params[:morpheme])
    @morpheme.language = current_language

    if @morpheme.save
      redirect_to(language_morpheme_path(@morpheme.language, @morpheme), :notice => 'Morpheme was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @morpheme = Morpheme.find(params[:id])

    if @morpheme.update_attributes(params[:morpheme])
      redirect_to(language_morpheme_path(@morpheme.language, @morpheme), :notice => 'Morpheme was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    Morpheme.find(params[:id]).destroy
    redirect_to(morphemes_url)
  end
end
