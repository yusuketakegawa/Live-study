class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader

  has_many :created_studies, class_name: "Study", foreign_key: "owner_id"
end
