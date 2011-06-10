class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
    
  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      if @user_session.save
        format.html { redirect_to(:root, :notice => 'Login Successful') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy

    respond_to do |format|
      format.html { redirect_to(:login, :notice => 'Goodbye!') }
    end
  end
end