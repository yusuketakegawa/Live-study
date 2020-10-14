class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(message_params)
      respond_to do |format|
        format.json { render 'json' }
      end
      @message.save_notification_message!(current_user, @message.room_id, @message.id)
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
    "/rooms/#{@message.room_id}"
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id)
  end
end
