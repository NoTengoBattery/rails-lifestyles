puts "Deleted #{Article.delete_all} objects from the database"

new_records = 5000
records = 0

until records >= new_records  do
  begin
    article = FactoryBot.build(:article)
    user_id = User.order(Arel.sql("RANDOM()")).first.id
    article.AuthorId = user_id
    rand(1..5).times do
      article.categories << Category.order(Arel.sql("RANDOM()")).first
    end
    article.save
    puts "Created a new record for the database with { title: #{article.Title} }"
    records += 1
  rescue ActiveRecord::RecordInvalid
    puts "Skipping invalid record..."
  rescue ActiveRecord::RecordNotUnique
    puts "Skipping not unique record..."
  end
end
