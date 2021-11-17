# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do
  my_restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    category: %w[chinese italian japanese french belgian][rand(0..4)]
  )
  10.times do
    review = Review.new(
      content: Faker::Restaurant.review,
      rating: rand(0..5),
      restaurant: my_restaurant
    )
    review.save!
  end
  my_restaurant.save!
end
