FactoryBot.define do
  factory :user do
    Name { Faker::Internet.username }
  end
end
