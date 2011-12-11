class PasswordResetsController < ApplicationController
  before_filter :get_user, only: [:update, :edit]
  before_filter :check_token_expiration, only: [:update, :edit]

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to login_path, notice: "Password reset instructions sent to #{params[:email]}."
  end
      
  def update
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      redirect_to login_path, notice: "Password has been reset."
    else
      render :edit
    end
  end
  
  private
  def get_user
    @user = User.find_by_password_reset_token!(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to new_password_reset_path, alert: "Invalid Token."
  end
  
  def check_token_expiration
    if @user.password_reset_requested_at < 30.minutes.ago
      redirect_to new_password_reset_path, alert: "Password reset token has expired. Request another reset." and return false
    end
  end
end
