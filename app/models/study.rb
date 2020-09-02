class Study < ApplicationRecord
  # has_many :study_users
  # has_many :users, through: :study_users

  validates :name, length: {maximum: 50}, presence: true
  validates :introduce, length: {maximum: 300}, presence: true
  validates :end_at, presence: true
  validates :tool, presence: true
  validates :category, presence: true


end
