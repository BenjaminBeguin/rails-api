# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



5.times do
	Post.create(
		user_id: User.order("RANDOM()").first.id,
		title: Faker::Lorem.sentence,
		content: Faker::Lorem.sentence(7, true),
		created_at: Faker::Date.between(2.days.ago, Date.today).to_date
	)
end