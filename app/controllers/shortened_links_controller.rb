class ShortenedLinksController < ApplicationController
  before_action :authenticate_user!

  def new
    @shortened_links= current_user.shortened_links.build
  end

  def index
    @shortened_links = current_user.shortened_links
  end
end
