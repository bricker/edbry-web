class PagesController < ApplicationController
  before_filter :require_login, except: [:show, :index]
  before_filter :get_page, except: [:index, :new, :create]
  respond_to :html
  
  def new
    @page = Page.new
  end
  
  def create
    @page = Page.new(params[:page])
    @page.text_id = params[:page][:text_id]
    if @page.save
      respond_with @page, notice: "Added page.", location: view_page_path(@page)
    else
      render :new
    end
  end
  
  def update
    if @page.update_attributes(params[:page])
      respond_with @page, notice: "Updated Page", location: view_page_path(@page)
    else
      render :edit
    end
  end
  
  def destroy
    flash[:notice] = "Deleted page." if @page.destroy
    respond_with @page, location: root_path
  end
  
  private
    def get_page
      @page = Page.find_by_text_id(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to root_path, alert: "Page not found."
    end
end
