class UsersController < ApplicationController

  before_filter :not_admin, :only => [:admin]

  before_filter :require_login, :only => [:show]

  def index

    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  def show
    @user = User.find(session[:user_id])
    @itineraries = current_user.itineraries

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
    @user = User.create(params[:user])
    auto_login(@user)
  end

  def admin
    @planes = Plane.all
  end


  def purchase
    @flight = params[:flight_id]
  end

  def start_roundtrip

  end

  def save_purchase
    flight = params[:flight]
    @seats = params[:seats].split(",")
    seats_array = []
    @seats.each do |seat|
      letter = seat[0]
      number = seat[1..-1]
      seats_array << Seat.where(:flight_id => flight, :row_number => number, :seat_letter => letter).first
    end
    confirmation_number = (0...8).map{(65+rand(26)).chr}.join
    seats_array.each do |seat|
      seat.update_attribute(:confirm_number, confirmation_number)
    end
    current_user.seats << seats_array
    @itinerary = Itinerary.create(:user_id => current_user.id)
    @itinerary.flights << Flight.find(flight)
    UserMailer.purchase_confirmation(current_user).deliver
    redirect_to user_path(current_user)
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
