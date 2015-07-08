class ShortenedLinksController < ApplicationController
  before_action :authenticate_user!, :except => [:redirect_link]
  before_action :set_shortened_link, :only => [:show, :edit, :update, :destroy]

  def new
    @shortened_link = current_user.shortened_links.build
  end

  def show

  end

  def edit

  end

  def update
    respond_to do |format|
      if @shortened_link.update(shortened_links_params)
        format.html { redirect_to shortened_link_path(@shortened_link.unique_identifier), notice: 'The URL was successfully updated.'}
      else
        format.html { render action: 'edit'}
      end
    end
  end

  def redirect_link
    @shortened_link = ShortenedLink.find_by(unique_identifier: params[:unique_identifier])
    redirect_to @shortened_link.website_url
  end

  def index
    @shortened_links = current_user.shortened_links
  end

  def create
    @shortened_link = current_user.shortened_links.new(shortened_links_params)
    respond_to do |format|
      if @shortened_link.save
        format.html { redirect_to shortened_link_path(@shortened_link.unique_identifier), notice: 'The URL was successfully shortened.'}
      else
        format.html { render action: 'new'}
      end
    end
  end

  def destroy
    @shortened_link.destroy
    flash[:notice] = "Successfully destroyed link"
    redirect_to shortened_links_path
  end

private
  def shortened_links_params
    params.require(:shortened_link).permit(:website_url)
  end

  def set_shortened_link
    @shortened_link = current_user.shortened_links.find_by(unique_identifier: params[:unique_identifier])
  end
end
