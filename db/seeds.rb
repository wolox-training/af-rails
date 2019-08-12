# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rent.delete_all if (Rent.count != 0)
BookSuggestion.delete_all if (BookSuggestion.count != 0)
User.delete_all if (User.count != 0)
Book.delete_all if (Book.count != 0)

user = User.create!(first_name: "alex", last_name: "falcon", email: "alex@hotmail.com", password: "123456789", locale: "es", confirmed_at: Time.zone.now)
50000.times { Book.create!(gender: "Metafiction", author: "Carlene Prosacco", image: "http://ziemann.net/andrea.cain", title: "Frequent Hearses", editor: "Tate Publishing \u0026 Enterprises", year: "2019-08-13") }
book = Book.last
Rent.create(user_id: user.id, book_id: book.id, start_date: Date.today, end_date: Date.today)
BookSuggestion.create!(user_id: user.id, synopsis: "Una gran sinopsis", price: 15.3, author: "Yo soy", title: "Mi otro yo", link: "www.yoyo.com", editor: "Obveo que yo", year: "2019")