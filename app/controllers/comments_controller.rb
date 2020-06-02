class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    authorize @comment
    @post = Post.find(params[:post_id])
  end
  
  def create
    @comment = Comment.new(set_params)
    authorize @comment
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @comment.user = current_user
    @comment.save ? (redirect_to post_path(@post)) : (render :new)
  end

  private

  def set_params
    params.require(:comment).permit(:content, :video)
  end
end
