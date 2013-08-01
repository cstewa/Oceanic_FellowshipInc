class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def not_authenticated
    redirect_to login_path, :alert => "Please login first."
  end

  def not_admin
    if current_user && current_user.is_admin == false
      redirect_to root_path, :alert => "This page is for admins only. Please log in as an admin."
    end
  end

end
