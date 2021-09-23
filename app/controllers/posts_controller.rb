# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_site

  def index
    @tags = @site.tags
    @posts = if params[:tag_id].present?
               @site.posts.where(tag_id: params[:tag_id]).order(created_at: :desc)
             else
               @site.posts.order(created_at: :desc)
             end
  end

  private

  def set_site
    @site = Site.includes(:tags, :posts).find_by(name: params[:site_name])
  end
end
