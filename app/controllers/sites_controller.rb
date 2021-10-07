# frozen_string_literal: true

# SitesController
class SitesController < ApplicationController
  before_action :set_site, only: %i[show]

  def index
    @sites = Site.all
  end

  def show; end

  private

  def set_site
    @site = Site.find_by(name: params[:site_name])
  end
end
