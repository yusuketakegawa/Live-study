20.times do |i|
  User.create!(
    nickname: "ユーザー#{i}",
    introduce: "こんにちは。はじめまして。現在自社開発企業に向けてポートフォリオさくせいちゅうです。
    是非一緒に勉強していただければ嬉しいです。よろしくお願いします。",
    image: "null#{i}",
    email: "test#{i}@example.com",
    password: "123456test",
    password_confirmation: "123456test"
  )
end
