class PostsController < ApplicationController
  def discover
    @posts = Post.all
  end

  def feed
    # for each user i follow, fetch its posts
    # push them into new array
    @posts = Post.where(user_id: current_user.following_ids)
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
