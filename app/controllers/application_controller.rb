class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def require_login
  	return true if current_user
  	flash[:alert] = "You must be logged in to access this page."
  	session[:return_to] = request.fullpath
  	redirect_to login_path and return false
  end
end
