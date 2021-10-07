# frozen_string_literal: true

# TagsController: Controller for the Tags model
class TagsController < ApplicationController
  before_action :set_site

  def index
    @tags ||= @site.tags.includes(:posts)
  end

  private

  def set_site
    @site = Site.find_by(name: params[:site_site_name])
  end
end
