class Study < ApplicationRecord
  # has_many :study_users
  # has_many :users, through: :study_users
  mount_uploader :image, ImageUploader
  validates :name, length: {maximum: 50}, presence: true
  validates :introduce, length: {maximum: 300}, presence: true
  validates :end_at, presence: true
  validates :tool_id, presence: true
  validates :category_id, presence: true


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :tool

  belongs_to :owner, class_name: "User"

  def created_by?(user)
    return false unless user
    owner_id == user.id
  end
  
end
