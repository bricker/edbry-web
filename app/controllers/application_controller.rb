class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_pages
  
  def get_pages
    @pages = Page.all
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def require_login
  	return true if current_user
  	session[:return_to] = request.fullpath
  	redirect_to login_path, alert: "You must be logged in to access this page." and return false
  end
end
