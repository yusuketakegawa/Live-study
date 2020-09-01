class Study < ApplicationRecord
  has_many :study_users
  has_many :users, thorough: :study_users

end
