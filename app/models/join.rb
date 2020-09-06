class Join < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :study

end
