puts "Deleted #{User.delete_all} objects from the database"

new_records = 200
records = 0

until records >= new_records  do
  begin
    user = FactoryBot.create(:user)
    puts "Created a new record for the database with { name: #{user.Name} }"
    records += 1
  rescue ActiveRecord::RecordInvalid
    puts "Skipping invalid record..."
  rescue ActiveRecord::RecordNotUnique
    puts "Skipping not unique record..."
  end
end
