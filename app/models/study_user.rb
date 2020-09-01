class StudyUser < ApplicationRecord
  belongs_to :study
  belongs_to :user
end
