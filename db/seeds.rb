100.times do |i|
  Study.create!(
    owner_id: "1",
    name: "name#{i}",
    introduce: "こんにちは",
    image: "null#{i}",
    url: "https://app.diagrams.net/?splash=0&libs=aws4#{i}",
    tool_id: "1",
    category_id: "1",
    end_at: "14:50:00"
  )
end
