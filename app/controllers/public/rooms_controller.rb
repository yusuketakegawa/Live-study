class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @current_entries = current_user.entries
    myroom = []

    # current_userのroom.idを格納
    @current_entries.each do |entry|
      myroom << entry.room.id
    end

    # current_userと相手側のユーザーが格納されているレコードを探す処理
    @another_entries = Entry.where(room_id: myroom).where.not(user_id: @user.id)
    @new_entries = @another_entries.order(created_at: :desc)
  end

  def create
    # users/showのformで送られてきたパラメータを元に部屋を作成する
    @room = Room.create

    # roomと同時に中間テーブルのentryもcreateする
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      # roomに紐づいたmessageを表示
      @messages = @room.messages
      @message = Message.new

      # roomの中のuserの情報を表示させるために中間テーブルの情報を取ってくる
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
