FactoryBot.define do
  factory :article do
    AuthorId { nil }
    CategoryId { nil }
    Title { Faker::Lorem.sentence }
    Text { Faker::Lorem.paragraph }
    Image { Faker::Internet.url }
    CreatedAt { Faker::Date.in_date_period }
  end
end
