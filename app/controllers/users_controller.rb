class UsersController < ApplicationController

  before_filter :require_login, :only => [:show]

  def index

    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  def show
    @user = User.find(session[:user_id])
    # @itineraries = current_user.itineraries

    respond_to do |format|
      format.html # show.html.erb
      format.js
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def create
    #
    @user = User.create(params[:user])
     binding.pry
  end

  def admin
    before_filter :is_admin
  end

  def admin
    before_filter :is_admin
  end

  def update
    @user = User.find(session[:user_id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.js
      else
        format.html { render action: "edit" }
        format.js
      end
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.js
    end
  end
end
