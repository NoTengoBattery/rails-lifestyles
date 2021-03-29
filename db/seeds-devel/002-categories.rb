new_records = 8
records = 0
invalid = 0

until records >= new_records do
  begin
    category = FactoryBot.create(:category)
    records += 1
    puts "[#{records}/#{new_records}] New record with { name: #{category.Name} }"
  rescue ActiveRecord::RecordInvalid
    invalid += 1
    puts "Skipping invalid record: ~> '#{$!.message}'"
  rescue ActiveRecord::RecordNotUnique
    puts "Skipping not unique record ~> '#{$!.message}'"
  end
end

puts "Created a total of #{records} records, #{invalid} validations failed"
