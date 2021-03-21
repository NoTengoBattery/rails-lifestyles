new_records = 250
records = 0
invalid = 0

until records >= new_records  do
  begin
    article = FactoryBot.build(:article)
    user_id = User.order(Arel.sql("RANDOM()")).first.id
    article.AuthorId = user_id
    rand(1..5).times do
      article.categories << Category.order(Arel.sql("RANDOM()")).first
    end
    article.save!
    records += 1
    puts "[#{records}/#{new_records}] New record with { title: #{article.Title} }"
  rescue ActiveRecord::RecordInvalid
    invalid += 1
    puts "Skipping invalid record: ~> '#{$!.message}'"
  rescue ActiveRecord::RecordNotUnique
    puts "Skipping not unique record ~> '#{$!.message}'"
  end
end

puts "Created a total of #{records} records, #{invalid} validations failed"
