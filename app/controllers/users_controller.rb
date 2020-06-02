class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def follow
    @user = User.find(params[:id])
    @follow = Follow.new(follower_id: current_user.id, followed_user_id: @user.id)
    return (redirect_to user_path(@user)) if @follow.save
  end
  
  def unfollow
    @user = User.find(params[:id])
    @follow = Follow.where(follower_id: current_user.id)
    @follow.destroy_all
    return (redirect_to user_path(@user)) if @follow.destroy_all
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
  end
end
