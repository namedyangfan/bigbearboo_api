# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"

Category.delete_all
Category.create! id: 1, name: "brides"
Category.create! id: 2, name: "bridesmaids"
Category.create! id: 3, name: "accessories"

Role.delete_all
Role.create! id: 1, name: "admin"
Role.create! id: 2, name: "user"

Size.delete_all
Size.create! id: 1, name: "2", category_id: "1"
Size.create! id: 2, name: "4", category_id: "1"
Size.create! id: 3, name: "6", category_id: "1"
Size.create! id: 4, name: "8", category_id: "1"
Size.create! id: 5, name: "10", category_id: "1"
Size.create! id: 6, name: "12", category_id: "1"
Size.create! id: 7, name: "14", category_id: "1"
Size.create! id: 8, name: "16", category_id: "1"
Size.create! id: 9, name: "18", category_id: "1"
Size.create! id: 10, name: "20", category_id: "1"
Size.create! id: 11, name: "22", category_id: "1"
Size.create! id: 12, name: "24", category_id: "1"
Size.create! id: 13, name: "26", category_id: "1"