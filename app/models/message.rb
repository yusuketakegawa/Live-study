class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :notifications, dependent: :destroy




  def save_notification_message!(current_user, room_id, message_id)
    temp_ids = Entry.where(room_id: room_id).where.not(user_id: current_user.id)
    @temp_ids = temp_ids.find_by(room_id: room_id)
    notification = current_user.active_notifications.new(
      message_id: message_id,
      room_id: room_id,
      visited_id: @temp_ids.user_id,
      action: 'message'
    )

    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
