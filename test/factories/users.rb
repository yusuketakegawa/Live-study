FactoryBot.define do
  factory :user, aliases: [:owner] do
      nickname {"test"}
      email { |n|"test#{n}@example.com"}
      password {"test1234"}
      password_confirmation {"test1234"}

      
  end
end