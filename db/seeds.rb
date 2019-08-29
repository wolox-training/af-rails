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

user = User.create!(first_name: "alex", last_name: "falcon", email: "alex@hotmail.com",
 password: "123456789", password_confirmation: '123456789', locale: I18n.available_locales.sample, confirmed_at: Time.zone.now, admin: true,
 reset_password_token: 'alex@hotmail.com')
# User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email,
#  password: "123456789", password_confirmation: '123456789', locale: I18n.available_locales.sample, confirmed_at: Time.zone.now,
#  reset_password_token: 'alex2@hotmail.com')
5000.times { Book.create!(gender: Faker::Book.genre, author: Faker::Book.author,
 image: Faker::Internet.url, title: Faker::Book.title.truncate(25),
  editor: Faker::Book.publisher, year: Faker::Date.forward(23)) }
book = Book.last
Rent.create(user_id: user.id, book_id: book.id, start_date: Faker::Date.forward(23), end_date: Faker::Date.forward(23))
BookSuggestion.create!(user_id: user.id, synopsis: Faker::Internet.url('todosloslibros.com', '/synopsis'),
 price: Faker::Number.decimal(2).to_f, author: Faker::Book.author,
  title: Faker::Book.title, link: Faker::Internet.url('todosloslibros.com'),
   editor: Faker::Book.publisher, year: Faker::Date.forward(23))