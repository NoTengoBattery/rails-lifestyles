puts "Deleted #{User.delete_all} objects from the database"

new_records = 100
records = 0

until records >= new_records  do
  begin
    user = FactoryBot.create(:user)
    records += 1
    puts "[#{records}/#{new_records}] New record with { name: #{user.Name} }"
  rescue ActiveRecord::RecordInvalid
    puts "Skipping invalid record: ~> '#{$!.message}'"
  rescue ActiveRecord::RecordNotUnique
    puts "Skipping not unique record ~> '#{$!.message}'"
  end
end

puts "Created a total of #{records} records"
