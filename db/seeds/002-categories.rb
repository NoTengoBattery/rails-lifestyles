puts "Deleted #{Category.delete_all} objects from the database"

new_records = 15
records = 0

until records >= new_records  do
  begin
    category = FactoryBot.create(:category)
    puts "Created a new record for the database with { name: #{category.Name} }"
    records += 1
  rescue ActiveRecord::RecordInvalid
    puts "Skipping invalid record..."
  rescue ActiveRecord::RecordNotUnique
    puts "Skipping not unique record..."
  end
end
