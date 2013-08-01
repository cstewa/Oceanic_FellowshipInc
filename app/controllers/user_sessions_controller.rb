class UserSessionsController < ApplicationController

  before_filter :require_login, :only => [:destroy]

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end

  def create
    @user = login(params[:email],params[:password])
  end

  def destroy
    logout
    redirect_to(root_path, :notice => 'Logged out!')
  end
end
