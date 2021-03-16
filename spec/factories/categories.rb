FactoryBot.define do
  factory :category do
    Name { Faker::Lorem.word }
    Priority { Faker::Number.within(range: 1..9999) }
  end
end
