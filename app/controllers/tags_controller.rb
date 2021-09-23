class TagsController < ApplicationController
  before_action :set_site

  def index
    @tags = @site.tags
  end

  private

  def set_site
    @site = Site.find_by(name: params[:site_name])
  end
end
