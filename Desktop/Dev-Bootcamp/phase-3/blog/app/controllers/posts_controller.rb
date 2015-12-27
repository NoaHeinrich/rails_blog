class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @post = Post.new(title: params[:title],
                    body: params[:body],
                    user_id: session[:user_id])
    if @post.save
      redirect_to "/posts"
    else
      redirect_to :back
    end
  end
end