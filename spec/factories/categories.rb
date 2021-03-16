FactoryBot.define do
  factory :category do
    Name { Faker::Lorem.word }
    Priority { Faker::Number.number }
  end
end
