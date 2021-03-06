# frozen_string_literal: true

# PostsController: Controller for Posts
class PostsController < ApplicationController
  before_action :set_site

  def index
    @posts = if params[:tag_id].present?
               @site.posts.where(tag_id: params[:tag_id])
             else
               @site.posts
             end
  end

  private

  def set_site
    @site = Site.includes(:tags, :posts).find_by(name: params[:site_site_name])
  end
end
