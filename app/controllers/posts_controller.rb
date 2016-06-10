class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :find_post, except: [:index, :new, :create]
  def index
    @posts = Post.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    current_user.posts.create(post_params)

    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
    @post.update_attributes(post_params)

    redirect_to root_path
  end

  def destroy
    @post.destroy

    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
