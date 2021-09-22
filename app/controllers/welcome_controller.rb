class WelcomeController < ApplicationController
  def index
    @tags = Tag.all
    @posts = Post.all
  end
end
