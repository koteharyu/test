# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |i|
  Member.create!(name: "member #{i}")
end

Party.create!(name: "1 party", member_ids: [1, 2])
Party.create!(name: "2 party", member_ids: [2, 3])
Party.create!(name: "3 party", member_ids: [3, 4])
Party.create!(name: "4 party", member_ids: [1, 2, 3, 4, 5])
