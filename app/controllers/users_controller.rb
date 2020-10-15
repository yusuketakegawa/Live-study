class UsersController < ApplicationController
  before_action :move_to_index
  before_action :set_user, only: %i[show mypage follows followers]
  # before_action :check_guest, only: :update
  before_action :study_room, only: %i[show mypage]
  def show
    # roomがcreateされた時にcurrent_userと相手側のユーザーをentriesテーブルに記録する必要があるのでwhereメソッドでユーザーを探す処理。
    @current_entry = Entry.where(user_id: current_user.id)
    @user_entry = Entry.where(user_id: @user.id)

    # current_userと相手側のユーザーのidが一緒の場合はこの式は動かない
    unless @user.id == current_user.id
      @current_entry.each do |cu|
        @user_entry.each do |u|
          # 既にroomが作成されている時
          next unless cu.room_id == u.room_id

          # roomが作られていないときの条件を記述するための記述
          @isroom = true

          # 既に作成されているroomidを特定
          @room_id = cu.room_id
        end
      end
      # roomが存在していない時にroomとentryのインスタンを生成する
      if @isroom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def mypage; end

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to mypage_user_path, notice: "情報を更新しました"
    else
      render :edit
    end
  end

  def follows
    @follow__users = @user.followings
    @follower__users = @user.followers
  end

  def followers
    @follow__users = @user.followings
    @follower__users = @user.followers
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :introduce, :image)
  end

  def move_to_index
    redirect_to root_path, notice: "アカウント登録もしくはログインしてください" unless user_signed_in?
  end

  def set_user
    @user = User.find(params[:id])
  end

  def check_guest
    redirect_to studies_path, notice: 'ゲストユーザーの編集・削除はできません。' if params[:user][:email].downcase == 'guest@example.com'
  end

  def study_room
    @studynow = @user.created_studies.without_deleted
    @study = @user.created_studies.only_deleted.recent
  end
end
