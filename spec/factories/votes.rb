FactoryBot.define do
  factory :vote do
    ArticleId { Faker::Number.number }
    UserId { Faker::Number.number }
  end
end
