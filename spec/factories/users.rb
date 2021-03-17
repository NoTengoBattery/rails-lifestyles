FactoryBot.define do
  factory :user do
    Name { Faker::Internet.username(specifier: 6..50) }
  end
end
