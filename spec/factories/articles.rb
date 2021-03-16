FactoryBot.define do
  factory :article do
    AuthorId { 1 }
    CategoryId { 1 }
    Title { "MyString" }
    Text { "MyText" }
    Image { "MyString" }
    CreatedAt { "2021-03-16" }
  end
end
