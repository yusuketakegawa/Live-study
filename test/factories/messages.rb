FactoryBot.define do
  factory :message do
      user_id {"1"}
      room_id { "1"}
      content {"test"}

      association :room
      association :user
  end
end