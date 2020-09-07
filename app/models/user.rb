class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader

  has_many :created_studies, class_name: "Study", foreign_key: "owner_id"
  has_many :joins
  
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following


  has_many :comments
  
  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
  
end
