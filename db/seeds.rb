# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.delete_all

50.times do
  Item.create!(
    name: Faker::Book.title,
    description: "random description",
    sku: rand(10 ** 10),
    image: "default image",
    quantity: rand(10 ** 4),
    price: 9.99
  )
end
