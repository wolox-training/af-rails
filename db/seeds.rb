# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: "alex", last_name: "falcon", email: "alex@hotmail.com", password: "123456789")
Books.create(gender: "Metafiction", author: "Carlene Prosacco", image: "http://ziemann.net/andrea.cain", title: "Frequent Hearses", editor: "Tate Publishing \u0026 Enterprises", year: "2019-08-13")
Rent.create!(user_id: 1, book_id: 1, start_date: Date.today, end_date: Date.today)