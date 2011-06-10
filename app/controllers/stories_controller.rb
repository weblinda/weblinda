class StoriesController < ApplicationController
  inherit_resources
  belongs_to :language  
  
  before_filter :require_user, :require_current_language
  
  def index
    @stories = current_language.stories.page params[:page]
    
    respond_to do |format|
      format.html
      format.json { render :json => @stories }
    end
  end

  def show
    @story = Story.find(params[:id])
    @allPhrases = Phrase.page(params[:page]) unless @story.phrases.any?
    
    respond_to do |format|
      format.html
      format.json { render :json => @story }
    end
  end

  def new
    @story = Story.new
    @phrases = Phrase.page(params[:page])
  end

  def edit
    @story = Story.find(params[:id])
  end

  def create
    @story = Story.new(params[:story])
    @story.language = current_language

    if @story.save
      redirect_to(language_story_path(@story.language, @story), :notice => 'Story was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @story = Story.find(params[:id])

    if @story.update_attributes(params[:story])
      redirect_to(language_story_path(@story.language, @story), :notice => 'Story was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    Story.find(params[:id]).destroy
    redirect_to(stories_url)
  end
  
  def order 
    ActiveRecord::Base.transaction do
      PhraseStory.where(:story_id => params[:id]).each do |phrase_story|
        new_position = params['phrase'].index(phrase_story.phrase_id.to_s)
        phrase_story.position = new_position
        phrase_story.save
      end
    end
    
    render :nothing => true
  end
  
  def tag
    story_id = params[:story_id]
    phrase_id = params[:phrase_id]
    
    story = Story.find(story_id)
    story.phrases << Phrase.find(phrase_id)
    story.save
    
    render :nothing => true
  end
  
  def remove
    PhraseStory.delete_all({ :story_id => params[:story_id], :phrase_id => params[:phrase_id] })
    
    render :nothing => true
  end
end
