class Join < ApplicationRecord
  acts_as_paranoid without_default_scope: true
  belongs_to :user, optional: true
  belongs_to :study
end
