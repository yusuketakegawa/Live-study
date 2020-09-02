class Study < ApplicationRecord
  has_many :study_users
  has_many :users, through: :study_users

end
