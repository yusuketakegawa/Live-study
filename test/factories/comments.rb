FactoryBot.define do
  factory :comment do
    user_id { "1" }
    study_id { "1" }
    text { "test" }

    association :study
    association :user
  end
end
