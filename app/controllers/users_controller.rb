class UsersController < ApplicationController
  
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update, :destroy]

  def new
    @user = User.new

    respond_to do |format|
      format.html
    end
  end

  def create    
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(:root, :notice => 'Login Successful') }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def show
    @user = @current_user
  end
  
  def edit
    @user = @current_user
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to @user
    else
      render :action => :edit
    end
  end

  def destroy
    @user = User.find
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(:login, :notice => 'Goodbye!') }
    end
  end
  
end
