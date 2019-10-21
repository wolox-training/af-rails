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

User.create!(first_name: "alex", last_name: "falcon", email: "alex@hotmail.com",
 password: "123456789", locale: I18n.available_locales.sample, confirmed_at: Time.zone.now, admin: true)
