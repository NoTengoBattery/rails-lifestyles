FactoryBot.define do
  factory :article do
    AuthorId { Faker::Number.number }
    Title { Faker::Lorem.sentence(word_count: 1, random_words_to_add: 15) }
    Text { Faker::Lorem.paragraph(sentence_count: 10, random_sentences_to_add: 250) }
    Image { Faker::Internet.url }
    CreatedAt { Faker::Date.in_date_period }
  end
end
