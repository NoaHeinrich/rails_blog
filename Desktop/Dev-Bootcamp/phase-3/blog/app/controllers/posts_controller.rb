class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    unless session[:user_id]
      redirect_to "/"
    end
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

  def edit

  end

  def update
    @post = Post.find(params[:id])
    @post.update(params[:post])
  end
end