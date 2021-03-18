puts "Deleted #{Category.delete_all} objects from the database"

new_records = 20
records = 0

until records >= new_records  do
  begin
    category = FactoryBot.create(:category)
    records += 1
    puts "[#{records}/#{new_records}] Created a new record for the database with { name: #{category.Name} }"
  rescue ActiveRecord::RecordInvalid
    puts "Skipping invalid record: ~> '#{$!.message}'"
  rescue ActiveRecord::RecordNotUnique
    puts "Skipping not unique record ~> '#{$!.message}'"
  end
end

puts "Created a total of #{records} records"
