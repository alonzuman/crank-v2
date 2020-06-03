class PostsController < ApplicationController
  def discover
    @posts = policy_scope(Post).order(created_at: :desc)
    authorize @posts
    # @posts = Post.all.order(created_at: :desc)
  end

  def feed
    # for each user i follow, fetch its posts
    # push them into new array
    @posts = Post.where(user_id: current_user.following_ids)
    authorize @posts
  end

  def new
    @post = Post.new
    authorize @post
  end
  
  def create
    @post = Post.new(set_params)
    @post.user = current_user
    authorize @post
    @post.save ? (redirect_to post_path(@post)) : (render :new)
  end

  def show
    @post = Post.find(params[:id])
    authorize @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    authorize @post
    redirect_to root_path
  end

  private

  def set_params
    params.require(:post).permit(:description, :video)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
