class PostsController < ApplicationController
  def index
    @posts = if params[:tag_id].present?
               Post.where(tag_id: params[:tag_id])
             else
               Post.all
             end
  end
end
