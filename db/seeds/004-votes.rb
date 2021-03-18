puts "Deleted #{Vote.delete_all} objects from the database"

new_records = 2500
records = 0

until records >= new_records  do
  begin
    vote = FactoryBot.build(:vote)
    user_id = User.order(Arel.sql("RANDOM()")).first.id
    article_id = Article.order(Arel.sql("RANDOM()")).first.id
    vote.UserId = user_id
    vote.ArticleId = article_id
    vote.save!
    records += 1
    puts "[#{records}/#{new_records}] Created a new record for the database with { user: #{vote.UserId} ; article: #{vote.ArticleId} }"
  rescue ActiveRecord::RecordInvalid
    puts "Skipping invalid record: ~> '#{$!.message}'"
  rescue ActiveRecord::RecordNotUnique
    puts "Skipping not unique record ~> '#{$!.message}'"
  end
end

puts "Created a total of #{records} records"
