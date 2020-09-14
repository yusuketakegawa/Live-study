class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:show]
  def show
    @user=User.find(params[:id])
    @studyNow = @user.created_studies.without_deleted
    @study = @user.created_studies.only_deleted.order(created_at: "DESC").page(params[:page]).per(12)
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def mypage
    @user=User.find(params[:id])
    @studyNow = @user.created_studies.without_deleted
    @study = @user.created_studies.only_deleted.order(created_at: "DESC").page(params[:page]).per(12)
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to mypage_user_path, notice: "情報を更新しました"
    else
      render :edit
    end
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  private 

  def user_params
    params.require(:user).permit(:nickname, :email, :introduce, :image)
  end
end
