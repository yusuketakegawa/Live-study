class RelationshipsController < ApplicationController
  def create
    @follow = current_user.active_relationships.build(follower_id: params[:user_id])
    @user = User.find(params[:user_id])
    @user.create_notification_follow!(current_user)
    redirect_back(fallback_location: root_path) if @follow.save
  end

  def destroy
    @follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    @user = User.find(params[:user_id])
    redirect_back(fallback_location: root_path) if @follow.destroy
  end
end
