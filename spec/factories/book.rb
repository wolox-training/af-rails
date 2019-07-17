FactoryBot.define do
  factory :book do
    gender{ Faker::Book.genre}
    author{ Faker::Book.author}
    image{ Faker::String.random}
    title{ Faker::Book.title}
    editor{ Faker::Book.publisher}
    year{ (Date.today - Faker::Number.number(3).to_i.days).to_s}
  end
end