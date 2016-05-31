class PostsController < ApplicationController
  def index
    @posts = Post.order("created_at")
  end

  def new
  end

  def create
    @post = Post.create(post_params)

    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
