# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rake::Task["db:reset"].invoke

Rails.env.production? ? (seeds="production") : (seeds="devel")
Dir[Rails.root.join("db/seeds-#{seeds}/*.rb")].sort.each do |file|
  puts "Processing #{file.split('/').last}"
  require file
end
