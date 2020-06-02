class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(set_params)
    @post.user = current_user
    @post.save ? (redirect_to post_path(@post)) : (render :new)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
  end

  private

  def set_params
    params.require(:post).permit(:description, :video)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
