class Join < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :study

    ransacker :joins_count do
    query = '(SELECT COUNT(joins.study_id) FROM joins where joins.study_id = studies.id GROUP BY joins.study_id)'
    Arel.sql(query)
  end
end
