class RelationshipsController < ApplicationController

  def create
    @follow = current_user.active_relationships.build(follower_id: params[:user_id])
    @user = User.find(params[:user_id])
    @user.create_notification_follow!(current_user)
    if @follow.save
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    @user = User.find(params[:user_id])
    if @follow.destroy
      redirect_back(fallback_location: root_path)
    end
  end
end
