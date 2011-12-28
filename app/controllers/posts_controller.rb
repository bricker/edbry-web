class PostsController < ApplicationController
  before_filter :require_login, except: [:index, :show]
  before_filter :get_post, except: [:index, :new, :create]
  layout 'minimal', except: [:index, :show]
  layout 'application', only: [:index, :show]
  
  respond_to :html, :js
    
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post].merge!(user_id: @current_user.id))
    flash[:notice] = "Added post." if @post.save
    respond_with @post
  end
  
  def update
    flash[:notice] = "Updated post." if @post.update_attributes(params[:post])
    respond_with @post
  end
  
  def destroy
    flash[:notice] = "Deleted post." if @post.destroy
    respond_with @post
  end
  
  private
    def get_post
      @post = Post.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to root_path, alert: "Post not found"
    end
end
