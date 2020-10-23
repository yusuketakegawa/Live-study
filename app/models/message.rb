class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :notifications, dependent: :destroy

  # メッセージを送信した時に通知が来る処理
  def save_notification_message!(current_user, room_id, message_id)
    temp_ids = Entry.where(room_id: room_id).where.not(user_id: current_user.id)
    @temp_ids = temp_ids.find_by(room_id: room_id)
    notification = current_user.active_notifications.new(
      message_id: message_id,
      room_id: room_id,
      visited_id: @temp_ids.user_id,
      action: 'message'
    )
    @slack_url = User.find_by(id: @temp_ids.user_id, slack_url: nil)
    if @slack_url.present?
    else
      notifier = Slack::Notifier.new(
        @temp_ids.user.slack_url
      )
      notifier.ping '【Live-study】新しいメッセージが届いています https://live-study.work/notifications'
    end
    notification.checked = true if notification.visitor_id == notification.visited_id
    notification.save if notification.valid?
  end
end
