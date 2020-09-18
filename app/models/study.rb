class Study < ApplicationRecord
  acts_as_paranoid without_default_scope: true
  mount_uploader :image, ImageUploader
  validates :name, length: { maximum: 50 }, presence: true
  validates :introduce, length: { maximum: 300 }, presence: true
  validates :end_at, presence: true
  validates :tool_id, presence: true
  validates :category_id, presence: true
  validates :url, format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :tool
  belongs_to :owner, class_name: "User"
  has_many :joins, dependent: :destroy

  has_many :comments

  has_many :notifications, dependent: :destroy

  def created_by?(user)
    return false unless user

    owner_id == user.id
  end

  # フォローしているユーザーが部屋を開催した時のみ通知が来る
  def create_notification_study!(current_user, study_id)
    temp_ids = current_user.follower_ids
    temp_ids.each do |temp_id|
      save_notification_study!(current_user, study_id, temp_id)
    end
  end

  def save_notification_study!(current_user, study_id, visited_id)
    notification = current_user.active_notifications.new(
      study_id: study_id,
      visited_id: visited_id,
      action: 'study'
    )
    notification.checked = true if notification.visitor_id == notification.visited_id
    notification.save if notification.valid?
  end

  ransacker :joins_count do
    query = '(SELECT COUNT(joins.study_id) FROM joins where joins.study_id = studies.id GROUP BY joins.study_id)'
    Arel.sql(query)
  end

  scope :active, -> { where(deleted_at: nil) }
  scope :sorted, -> { order(created_at: :desc) }
  scope :paginate, -> { page([:page]).per(12) }
  scope :recent, -> { sorted.page }
end
