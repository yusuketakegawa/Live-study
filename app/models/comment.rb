class Comment < ApplicationRecord
  belongs_to :study
  belongs_to :user
  validates :text, presence: true
end
