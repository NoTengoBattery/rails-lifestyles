FactoryBot.define do
  factory :category do
    Name { Faker::Lorem.word.capitalize }
    Priority { Faker::Number.number }
  end
end
