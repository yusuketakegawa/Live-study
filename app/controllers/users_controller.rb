class UsersController < ApplicationController
  before_action :move_to_index, only: [:show]
  before_action :set_user, only: [:show, :mypage, :follows, :followers]

  def show
    @studyNow = @user.created_studies.without_deleted
    @study = @user.created_studies.only_deleted.order(created_at: "DESC").page(params[:page]).per(12)

    #roomがcreateされた時にcurrent_userと相手側のユーザーをentriesテーブルに記録する必要があるのでwhereメソッドでユーザーを探す処理。
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)

    #current_userと相手側のユーザーのidが一緒の場合はこの式は動かない
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|

          #既にroomが作成されている時
          if cu.room_id == u.room_id then

            #roomが作られていないときの条件を記述するための記述
            @isRoom = true

            #既に作成されているroomidを特定
            @roomId = cu.room_id
          end
        end
      end
      #roomが存在していない時にroomとentryのインスタンを生成する
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def mypage
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
    @follow__users = user.followings
    @follower__users = user.followers
  end

  def followers
    @follow__users = user.followings
    @follower__users = user.followers
  end

  private 

  def user_params
    params.require(:user).permit(:nickname, :email, :introduce, :image)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path, notice: "アカウント登録もしくはログインしてください"
    end
  end

  def set_user
    @user=User.find(params[:id])
  end
  
end
