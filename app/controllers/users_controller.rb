class UsersController < ApplicationController
  before_filter :get_user, only: [:show, :edit, :update, :destroy]
  before_filter :require_login
  respond_to :html
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    flash[:notice] = "Added user." if @user.save
    respond_with @user 
  end
  
  def update
    flash[:notice] = "Updated user." if @user.update_attributes(params[:user])
    respond_with @user
  end
  
  def destroy
    flash[:notice] = "Deleted user." if @user.destroy
    respond_with @user
  end
  
  private
    def get_user
      @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to root_path, alert: "User not found"
    end 
end
