FactoryBot.define do
  factory :study do
    owner_id {"1"}
    name {"テストの部屋"}
    introduce {"頑張りましょう"}
    url {"https://us04web.zoom.us/j/4336842031?pwd=aFIvTkpDNCtSa3c1dEl3M1JZcVovZz09"}
    tool_id {"1"}
    category_id {"1"}
    end_at {"03:00:00"}

    association :owner
  end


end
