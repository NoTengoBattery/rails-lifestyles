FactoryBot.define do
  factory :article do
    AuthorId { Faker::Number.number }
    Title { Faker::Lorem.sentence(word_count: 2, random_words_to_add: 20) }
    Text { Faker::Lorem.paragraph(sentence_count: 5, random_sentences_to_add: 100) }
    CreatedAt { Faker::Date.in_date_period }
  end
end
