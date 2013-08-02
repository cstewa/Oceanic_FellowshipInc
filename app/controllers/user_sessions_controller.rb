class UserSessionsController < ApplicationController

  before_filter :require_login, :only => [:destroy]

  def new
    @user = User.new
    if !params[:flight_id].nil?
      @flight = Flight.find(params[:flight_id])
    end

    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end

  def create
    @user = login(params[:email],params[:password])
    if !params[:flight_id].nil?
      @flight = Flight.find(params[:flight_id])
    end
  end

  def destroy
    logout
    redirect_to(root_path, :notice => 'Logged out!')
  end
end
