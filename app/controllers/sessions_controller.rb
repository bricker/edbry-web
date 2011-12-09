class SessionsController < ApplicationController  
  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password]) # authenticate is a method given to us by Rails' has_secure_password method
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Logged in."
    else
      flash.now.alert = "Invalid login information."
      render 'new' # Renders the login page (sessions#new) with the "invalid" error (flash[:alert])
    end
  end
  
  def destroy
    session[:user_id] = @current_user = nil
    redirect_to root_path, :notice => "Logged out."
  end
end
